import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:snake_online/model/game/game_state.dart';
import 'package:snake_online/model/network/message_handler.dart';

import '../model/network/address.dart';
import '../model/proto/snake.pb.dart';
import 'engine.dart';

typedef Snake = GameState_Snake;
typedef Coord = GameState_Coord;

class EngineMaster implements Engine {
  final GameConfig config;
  late GameStateMutable currentState;
  late final GamePlayer player;
  late final Snake playerSnake;
  final List<Snake> removalList = [];
  var movingStarted = false;
  late Timer _timer;
  final Map<Address, GamePlayer> addresses = {};
  static bool _listenedAlready = false;
  static late final StreamSubscription<MessageWithSender> _joinSubscription;
  static late final StreamSubscription<MessageWithSender> _steerSubscription;

  EngineMaster({required this.config, required this.player}) {
    currentState = GameStateMutable(config: config);
    currentState.initZeroState(player);
    playerSnake = currentState.snakes[0];
    startSendAnnouncements();
    if (_listenedAlready) {
      _joinSubscription.resume();
      _steerSubscription.resume();
      return;
    }
    _joinSubscription = listenJoins();
    _steerSubscription = listenSteers();
    _listenedAlready = true;
  }

  StreamSubscription<MessageWithSender> listenSteers() {
    return MessageHandler().steerMessages.stream.listen((event) {
      var address = Address(internetAddress: event.address, port: event.port);
      for (MapEntry<Address, GamePlayer> entry in addresses.entries) {
        if (entry.key.internetAddress.address ==
                address.internetAddress.address &&
            entry.key.port == address.port) {
          var player = entry.value;
          var snakes = currentState.snakes
              .where((element) => element.playerId == player.id);
          if (snakes.isEmpty) continue;
          var snake = snakes.first;
          snake.headDirection = event.gameMessage.steer.direction;
        }
      }
    });
  }

  StreamSubscription<MessageWithSender> listenJoins() {
    return MessageHandler().joinMessages.stream.listen((event) {
      NodeRole role = event.gameMessage.join.requestedRole;
      int newId = currentState.players.length + 1;
      if (role != NodeRole.VIEWER) {
        try {
          Snake snake = currentState.getNewSnake(newId);
          currentState.snakes.add(snake);
        } catch (e) {
          MessageHandler().sendError(
              address: event.address,
              port: event.port,
              errorMsg: "No space available");
          return;
        }
      }
      var joinedPlayer = GamePlayer(
          id: newId,
          name: event.gameMessage.join.playerName,
          type: event.gameMessage.join.playerType);
      currentState.players.add(joinedPlayer);
      MessageHandler().sendAck(
          address: event.address,
          port: event.port,
          msgSeq: event.gameMessage.msgSeq,
          receiverId: newId);
      addresses[Address(internetAddress: event.address, port: event.port)] =
          joinedPlayer;
    });
  }

  @override
  void handlePressedKeyEvent(KeyEvent event) {
    switch (event.character?.toUpperCase()) {
      case 'W':
        changeDir(Direction.UP);
        break;
      case 'A':
        changeDir(Direction.LEFT);
        break;
      case 'S':
        changeDir(Direction.DOWN);
        break;
      case 'D':
        changeDir(Direction.RIGHT);
        break;
    }
  }

  static Direction opposite(Direction dir) {
    if (dir == Direction.LEFT) return Direction.RIGHT;
    if (dir == Direction.RIGHT) return Direction.LEFT;
    if (dir == Direction.UP) return Direction.DOWN;
    return Direction.UP;
  }

  void changeDir(Direction direction) {
    movingStarted = true;
    if (opposite(direction) == playerSnake.headDirection) return;
    playerSnake.headDirection = direction;
  }

  @override
  GameStateMutable update() {
    int foodEatenCount = 0;
    removalList.clear();
    for (Snake snake in currentState.snakes) {
      if (snake == playerSnake && !movingStarted) continue;
      Coord head = snake.points[0];
      Coord newHead = Coord(x: 0, y: 0);
      switch (snake.headDirection) {
        case Direction.LEFT:
          newHead = Coord(
              x: GameStateMutable.tor(head.x - 1, config.width), y: head.y);
          break;
        case Direction.RIGHT:
          newHead = Coord(
              x: GameStateMutable.tor(head.x + 1, config.width), y: head.y);
          break;
        case Direction.DOWN:
          newHead = Coord(
              x: head.x, y: GameStateMutable.tor(head.y + 1, config.height));
          break;
        case Direction.UP:
          newHead = Coord(
              x: head.x, y: GameStateMutable.tor(head.y - 1, config.height));
          break;
      }
      bool crossedSnake = false;
      for (Snake playerSnake in currentState.snakes) {
        if (playerSnake.points.contains(newHead)) {
          crossedSnake = true;
          break;
        }
      }
      if (crossedSnake) {
        removalList.add(snake);
        continue;
      }
      if (currentState.foods.contains(newHead)) {
        foodEatenCount++;
        currentState.foods.remove(newHead);
        for (GamePlayer player in currentState.players) {
          if (player.id == snake.playerId) {
            player.score += 1;
            break;
          }
        }
      } else {
        snake.points.removeAt(snake.points.length - 1);
      }
      snake.points.insert(0, newHead);
    }
    for (Snake snake in removalList) {
      currentState.removeSnake(snake);
    }
    currentState.placeFoods(foodEatenCount);
    currentState.stateOrder++;
    sendCurrentState();
    return currentState;
  }

  void sendCurrentState() {
    if (addresses.isEmpty) return;
    GameState current = GameState(
        players: GamePlayers(players: currentState.players),
        foods: currentState.foods,
        snakes: currentState.snakes,
        stateOrder: currentState.stateOrder);
    for (Address a in addresses.keys) {
      MessageHandler().sendState(
          address: a.internetAddress, port: a.port, gameState: current);
    }
  }

  @override
  void shutdown() {
    _joinSubscription.pause();
    _steerSubscription.pause();
    _timer.cancel();
  }

  void startSendAnnouncements() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      MessageHandler().sendAnnouncementMulticast(games: [
        GameAnnouncement(
            players: GamePlayers(players: currentState.players),
            config: config,
            canJoin: true,
            gameName: "${player.name}'s game")
      ]);
    });
  }
}
