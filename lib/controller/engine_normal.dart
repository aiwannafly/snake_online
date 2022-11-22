import 'dart:io';

import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:snake_online/controller/engine.dart';
import 'package:snake_online/model/network/message_handler.dart';

import '../components/game_field.dart';
import '../model/game/game_state.dart';
import '../model/proto/snake.pb.dart';

class EngineNormal implements Engine {
  final GameConfig config;
  late GameFieldState renderer;
  late final GameStateMutable currentState;
  var prevHeadDirection = Direction.UP;
  var headDirection = Direction.UP;
  InternetAddress masterAddress;
  int masterPort;

  @override
  void setRenderer(GameFieldState renderer) {
    this.renderer = renderer;
  }

  EngineNormal({required this.config,
  required this.masterAddress, required this.masterPort}) {
    currentState = GameStateMutable(config: config, stateOrder: 0);
    MessageHandler().receivedStates.stream.listen((event) {
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
  void render() {
    renderer.update(currentState);
  }

  @override
  void shutdown() {
    // TODO: implement shutdown
  }

  @override
  void update() {
    // print('try to send steer to ${masterAddress.address} $masterPort');
    MessageHandler().sendSteer(
        address: masterAddress,
        port: masterPort,
        direction: headDirection
    );
    prevHeadDirection = headDirection;
  }
}
