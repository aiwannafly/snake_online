import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'package:snake_online/model/game/game_state.dart';

import '../model/network/address.dart';
import '../model/network/message_handler.dart';
import '../model/proto/snake.pb.dart';
import 'engine.dart';

typedef Snake = GameState_Snake;
typedef Coord = GameState_Coord;

abstract class EngineBase implements Engine {
  final GameConfig config;
  late GameStateMutable currentState;
  final Map<Address, GamePlayer> nodes = {};
  final disconnectTimers = HashMap<Address, Timer>();
  late final disconnectTime = Duration(
      milliseconds: (config.stateDelayMs * 0.8).ceil());
  late final StreamSubscription<MessageWithSender> _subscriptionKA;
  late Timer _sendPingTimer;

  EngineBase({required this.config}) {
    _sendPingTimer = Timer.periodic(
        Duration(milliseconds: (disconnectTime.inMilliseconds / 2).ceil()), (timer) {
      sendPing();
    });
    _subscriptionKA = listenPing();
  }

  void sendPing();

  void handleDisconnect(Address address) {
    debugPrint('${address.internetAddress.address} ${address.port} disconnects');
    currentState.players.remove(nodes.remove(address));
  }

  void setDisconnectTimer(Address address) {
    disconnectTimers[address] = Timer(disconnectTime,
            () => handleDisconnect(address));
  }

  GamePlayer? get deputy {
    for (GamePlayer player in currentState.players) {
      if (player.role == NodeRole.DEPUTY) return player;
    }
    return null;
  }

  void resetDisconnectTimer(Address address) {
    if (disconnectTimers.containsKey(address)) {
      disconnectTimers[address]!.cancel();
    }
    disconnectTimers[address] = Timer(disconnectTime,
            () => handleDisconnect(address));
  }

  StreamSubscription<MessageWithSender> listenPing() {
    return MessageHandler().pingMessages.stream.listen((event) {
      resetDisconnectTimer(Address(internetAddress: event.address, port: event.port));
    });
  }

  void handleRoleChange(MessageWithSender message);

  StreamSubscription<MessageWithSender> listenRoleChange() {
    return MessageHandler().roleChangeMessages.stream.listen((event) {
      var address = Address(internetAddress: event.address, port: event.port);
      handleRoleChange(event);
      resetDisconnectTimer(address);
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

  void changeDir(Direction direction);

  @override
  void shutdown() {
    _sendPingTimer.cancel();
    _subscriptionKA.cancel();
    nodes.clear();
    for (Timer timer in disconnectTimers.values) {
      timer.cancel();
    }
  }
}
