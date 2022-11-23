import 'dart:async';
import 'dart:io';

import 'package:snake_online/controller/engine_base.dart';
import 'package:snake_online/model/network/address.dart';
import 'package:snake_online/model/network/message_handler.dart';

import '../model/game/game_state.dart';
import '../model/proto/snake.pb.dart';

class EngineNormal extends EngineBase {
  var prevHeadDirection = Direction.UP;
  var headDirection = Direction.UP;
  late Address masterAddress;
  final int playerId;
  late final StreamSubscription<MessageWithSender> _statesSubscription;

  EngineNormal(
      {required super.config,
      required InternetAddress masterAddress,
      required int masterPort,
      required this.playerId}) {
    this.masterAddress = Address(
        internetAddress: masterAddress, port: masterPort);
    setDisconnectTimer(this.masterAddress);
    currentState = GameStateMutable(config: config, stateOrder: 0);
    _statesSubscription = listenStates();
  }

  @override
  void sendPing() {
    MessageHandler().sendPing(
        address: masterAddress.internetAddress, port: masterAddress.port);
  }

  StreamSubscription<MessageWithSender> listenStates() {
    return MessageHandler().receivedStates.stream.listen((event) {
      print('got state');
      GameState recvState = event.gameMessage.state.state;
      if (recvState.stateOrder < currentState.stateOrder) return;
      currentState.stateOrder = recvState.stateOrder;
      currentState.snakes = recvState.snakes;
      currentState.players = recvState.players.players;
      currentState.foods = recvState.foods;
      resetDisconnectTimer(masterAddress);
    });
  }

  @override
  void changeDir(Direction direction) {
    if (EngineBase.opposite(direction) == prevHeadDirection) return;
    headDirection = direction;
  }

  @override
  void shutdown() {
    super.shutdown();
    _statesSubscription.pause();
  }

  @override
  GameStateMutable update() {
    MessageHandler().sendSteer(
        address: masterAddress.internetAddress, port: masterAddress.port, direction: headDirection);
    prevHeadDirection = headDirection;
    return currentState;
  }
}
