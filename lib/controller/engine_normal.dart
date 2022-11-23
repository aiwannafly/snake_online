import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:snake_online/controller/engine.dart';
import 'package:snake_online/model/network/message_handler.dart';

import '../model/game/game_state.dart';
import '../model/network/address.dart';
import '../model/network/node_info.dart';
import '../model/proto/snake.pb.dart';

class EngineNormal implements Engine {
  final GameConfig config;
  late final GameStateMutable currentState;
  var prevHeadDirection = Direction.UP;
  var headDirection = Direction.UP;
  InternetAddress masterAddress;
  int masterPort;
  static bool _listenedAlready = false;
  final Map<Address, NodeInfo> nodes = {};
  late final StreamSubscription<MessageWithSender> _statesSubscription;

  EngineNormal({required this.config,
  required this.masterAddress, required this.masterPort}) {
    currentState = GameStateMutable(config: config, stateOrder: 0);
    if (_listenedAlready) {
      _statesSubscription.resume();
      return;
    }
    _statesSubscription = listenStates();
    _listenedAlready = true;
  }

  StreamSubscription<MessageWithSender> listenStates() {
    return MessageHandler().receivedStates.stream.listen((event) {
      GameState recvState = event.gameMessage.state.state;
      if (recvState.stateOrder < currentState.stateOrder) return;
      currentState.stateOrder = recvState.stateOrder;
      currentState.snakes = recvState.snakes;
      currentState.players = recvState.players.players;
      currentState.foods = recvState.foods;
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
    if (opposite(direction) == prevHeadDirection) return;
    headDirection = direction;
  }

  @override
  void shutdown() {
    _statesSubscription.pause();
  }

  @override
  GameStateMutable update() {
    MessageHandler().sendSteer(
        address: masterAddress,
        port: masterPort,
        direction: headDirection
    );
    prevHeadDirection = headDirection;
    return currentState;
  }
}
