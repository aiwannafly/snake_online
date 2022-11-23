import 'dart:async';

import 'package:snake_online/controller/engine_base.dart';

import 'package:snake_online/model/game/game_state.dart';
import 'package:snake_online/model/network/message_handler.dart';

import '../model/network/address.dart';
import '../model/proto/snake.pb.dart';

typedef Snake = GameState_Snake;
typedef Coord = GameState_Coord;

class EngineMaster extends EngineBase {
  late final GamePlayer player;
  late final Snake playerSnake;
  final List<Snake> removalList = [];
  var movingStarted = false;
  late Address deputyAddress;
  late Timer _announcementsTimer;
  late final StreamSubscription<MessageWithSender> _joinSubscription;
  late final StreamSubscription<MessageWithSender> _steerSubscription;

  EngineMaster({required super.config, required this.player,
  GameStateMutable? initialState}) {
    if (initialState != null) {
      currentState = initialState;
      for (Snake snake in currentState.snakes) {
        if (snake.playerId == player.id) {
          playerSnake = snake;
          break;
        }
      }
    } else {
      currentState = GameStateMutable(config: config);
      currentState.initZeroState(player);
      playerSnake = currentState.snakes[0];
    }
    startSendAnnouncements();
    _joinSubscription = listenJoins();
    _steerSubscription = listenSteers();
  }

  StreamSubscription<MessageWithSender> listenSteers() {
    return MessageHandler().steerMessages.stream.listen((event) {
      var address = Address(internetAddress: event.address, port: event.port);
      var player = nodes[address];
      if (player == null) return;
      var snakes = currentState.snakes
          .where((element) => element.playerId == player.id);
      if (snakes.isEmpty) return;
      var snake = snakes.first;
      snake.headDirection = event.gameMessage.steer.direction;
      resetDisconnectTimer(address);
    });
  }

  StreamSubscription<MessageWithSender> listenJoins() {
    return MessageHandler().joinMessages.stream.listen((event) {
      print('got join');
      var join = event.gameMessage.join;
      NodeRole role = join.requestedRole;
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
      var address = Address(internetAddress: event.address, port: event.port);
      if (role == NodeRole.NORMAL && currentState.players.length == 1) {
        role = NodeRole.DEPUTY;
        deputyAddress = address;
      }
      var joinedPlayer = GamePlayer(
          id: newId,
          name: join.playerName,
          type: join.playerType,
          role: role
      );
      currentState.players.add(joinedPlayer);
      MessageHandler().sendAck(
          address: event.address,
          port: event.port,
          msgSeq: event.gameMessage.msgSeq,
          receiverId: newId
      );
      nodes[address] = joinedPlayer;
      print(nodes.length);
      print('added to nodes');
      setDisconnectTimer(address);
    });
  }

  @override
  void changeDir(Direction direction) {
    movingStarted = true;
    if (EngineBase.opposite(direction) == playerSnake.headDirection) return;
    playerSnake.headDirection = direction;
  }

  void removeDisconnected() {
    late var toRemove = <GamePlayer>[];
    for (GamePlayer player in currentState.players) {
      if (player == this.player) continue;
      if (!nodes.values.contains(player)) {
        toRemove.add(player);
      }
    }
    if (toRemove.isEmpty) return;
    print('remove player');
    currentState.players.removeWhere((element) => toRemove.contains(element));
  }

  @override
  GameStateMutable update() {
    removeDisconnected();
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
      for (GamePlayer player in currentState.players) {
        if (player.id == snake.playerId) {
          player.role = NodeRole.VIEWER;
        }
      }
      currentState.removeSnake(snake);
    }
    currentState.placeFoods(foodEatenCount);
    currentState.stateOrder++;
    sendCurrentState();
    return currentState;
  }

  @override
  void sendPing() {
    for (Address a in nodes.keys) {
      MessageHandler().sendPing(
          address: a.internetAddress, port: a.port);
    }
  }

  void sendCurrentState() {
    if (nodes.isEmpty) return;
    GameState current = GameState(
        players: GamePlayers(players: currentState.players),
        foods: currentState.foods,
        snakes: currentState.snakes,
        stateOrder: currentState.stateOrder);
    for (Address a in nodes.keys) {
      MessageHandler().sendState(
          address: a.internetAddress, port: a.port, gameState: current);
    }
  }

  @override
  void shutdown() {
    super.shutdown();
    _joinSubscription.pause();
    _steerSubscription.pause();
    _announcementsTimer.cancel();
  }

  void startSendAnnouncements() {
    _announcementsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
