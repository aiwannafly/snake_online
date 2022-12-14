import 'dart:async';
import 'dart:io';

import 'package:snake_online/controller/engine_base.dart';
import 'package:snake_online/model/network/address.dart';
import 'package:snake_online/model/network/message_handler.dart';

import '../model/game/game_state.dart';
import '../model/proto/snake.pb.dart';
import 'engine_master.dart';

class EngineNormal extends EngineBase {
  var prevHeadDirection = Direction.UP;
  var headDirection = Direction.UP;
  late Address masterAddress;
  final int playerId;
  late final StreamSubscription<MessageWithSender> _statesSubscription;
  EngineMaster? _engineMaster;

  EngineNormal(
      {required super.config,
      required InternetAddress masterAddress,
      required int masterPort,
      required this.playerId}) {
    this.masterAddress = Address(
        internetAddress: masterAddress, port: masterPort);
    currentState = GameStateMutable(config: config, stateOrder: 0);
    _statesSubscription = listenStates();
    setDisconnectTimer(this.masterAddress, 1000);
  }

  @override
  void sendPing() {
    if (_engineMaster != null) {
      _engineMaster!.sendPing();
      return;
    }
    MessageHandler().sendPing(
        address: masterAddress.internetAddress, port: masterAddress.port);
  }

  @override
  void handleDisconnect(Address address) {
    if (_engineMaster != null) {
      _engineMaster!.handleDisconnect(address);
      return;
    }
    super.handleDisconnect(address);
    var oldMasters = currentState.players
        .where((element) => element.role == NodeRole.MASTER);
    if (oldMasters.isNotEmpty) {
      currentState.players.remove(oldMasters.first);
    }
    for (GamePlayer player in currentState.players) {
      if (player.id == playerId) {
        if (player.role == NodeRole.NORMAL) {
          setDeputyAsNewMaster();
        } else if (player.role == NodeRole.DEPUTY) {
          player.role = NodeRole.MASTER;
          // now i am the master here
          sendNewMasterNotify();
          shutdown();
          _engineMaster = EngineMaster(
              config: config, player: player, initialState: currentState);
        }
      }
    }
  }

  void setDeputyAsNewMaster() {
    GamePlayer deputyPlayer = deputy!;
    masterAddress = Address(
        internetAddress: InternetAddress(deputyPlayer.ipAddress),
        port: deputyPlayer.port
    );
  }

  void sendNewMasterNotify() {
    bool newDeputyChosen = false;
    for (GamePlayer player in currentState.players) {
      if (player.id == playerId) continue;
      if (player.role == NodeRole.NORMAL && !newDeputyChosen) {
        newDeputyChosen = true;
        player.role = NodeRole.DEPUTY;
      }
      MessageHandler().sendRoleChange(
          address: InternetAddress(player.ipAddress),
          port: player.port,
          senderRole: NodeRole.MASTER,
          receiverRole: player.role);
    }
  }

  StreamSubscription<MessageWithSender> listenStates() {
    return MessageHandler().receivedStates.stream.listen((message) {
      GameState receivedState = message.gameMessage.state.state;
      if (receivedState.stateOrder < currentState.stateOrder) return;
      currentState.stateOrder = receivedState.stateOrder;
      currentState.snakes = receivedState.snakes;
      currentState.players = receivedState.players.players;
      currentState.foods = receivedState.foods;
      resetDisconnectTimer(
          Address(internetAddress: message.address, port: message.port));
    });
  }

  @override
  void changeDir(Direction direction) {
    if (_engineMaster != null) {
      _engineMaster!.changeDir(direction);
      return;
    }
    if (EngineBase.opposite(direction) == prevHeadDirection) return;
    headDirection = direction;
  }

  @override
  void handleRoleChange(MessageWithSender message) {
    if (_engineMaster != null) {
      _engineMaster!.handleRoleChange(message);
      return;
    }
    var senderRole = message.gameMessage.roleChange.senderRole;
    var receiverRole = message.gameMessage.roleChange.receiverRole;
    if (senderRole == NodeRole.MASTER) {
      masterAddress =
          Address(internetAddress: message.address, port: message.port);
    }
  }

  @override
  void shutdown() {
    if (_engineMaster != null) {
      _engineMaster!.shutdown();
      return;
    }
    super.shutdown();
    _statesSubscription.pause();
  }

  @override
  GameStateMutable update() {
    if (_engineMaster != null) {
      return _engineMaster!.update();
    }
    MessageHandler().sendSteer(
        address: masterAddress.internetAddress,
        port: masterAddress.port,
        direction: headDirection);
    prevHeadDirection = headDirection;
    return currentState;
  }
}
