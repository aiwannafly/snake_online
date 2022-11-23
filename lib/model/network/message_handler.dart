import 'dart:async';
import 'dart:io';
import 'package:snake_online/model/network/connection_handler.dart';
import 'package:snake_online/model/proto/snake.pb.dart';
import 'package:fixnum/fixnum.dart';

class MessageWithSender {
  InternetAddress address;
  int port;
  GameMessage gameMessage;

  MessageWithSender(
      {required this.address, required this.port, required this.gameMessage});
}

class MessageHandler {
  final List<MessageWithSender> discoverMessages = [];
  final StreamController<MessageWithSender> joinMessages = StreamController();
  final StreamController<MessageWithSender> pingMessages = StreamController();
  final StreamController<MessageWithSender> receivedStates = StreamController();
  final StreamController<MessageWithSender> roleChangeMessages = StreamController();
  final StreamController<MessageWithSender> steerMessages = StreamController();
  final StreamController<MessageWithSender> errorMessages = StreamController();
  final StreamController<MessageWithSender> ackMessages = StreamController();
  final StreamController<MessageWithSender> announcementsMessages = StreamController();
  Int64 _msgCounter = Int64(0);
  late final ConnectionHandler connectionHandler =
      ConnectionHandler(handleMessage: handleMessage);

  static final MessageHandler _singleton = MessageHandler._internal();

  factory MessageHandler() => _singleton;

  MessageHandler._internal();

  Int64 get msgSeq => _msgCounter++;

  void initAndStartListening() async {
    await connectionHandler.initialize();
    connectionHandler.listenAll();
  }

  void sendPing({
    required InternetAddress address,
    required int port,
  }) {
    var message = GameMessage(msgSeq: msgSeq,
        ping: GameMessage_PingMsg());
    connectionHandler.send(message.writeToBuffer(), address, port);
  }

  void sendSteer({
    required InternetAddress address,
    required int port,
    required Direction direction
  }) {
    var message = GameMessage(msgSeq: msgSeq,
        steer: GameMessage_SteerMsg(direction: direction));
    connectionHandler.send(message.writeToBuffer(), address, port);
  }

  void sendAck({
    required InternetAddress address,
    required int port,
    required Int64 msgSeq,
    int receiverId = 0
  }) {
    var message = GameMessage(msgSeq: msgSeq,
        ack: GameMessage_AckMsg(), receiverId: receiverId);
    connectionHandler.send(message.writeToBuffer(), address, port);
  }

  void sendState({
    required InternetAddress address,
    required int port,
    required GameState gameState
  }) {
    var message = GameMessage(msgSeq: msgSeq,
        state: GameMessage_StateMsg(state: gameState));
    connectionHandler.send(message.writeToBuffer(), address, port);
  }

  void sendAnnouncementMulticast({
    required List<GameAnnouncement> games
  }) {
    var message = GameMessage(msgSeq: msgSeq,
        announcement: GameMessage_AnnouncementMsg(games: games));
    connectionHandler.multicastSend(message.writeToBuffer());
  }

  void sendAnnouncement({
    required InternetAddress address,
    required int port,
    required List<GameAnnouncement> games
  }) {
    var message = GameMessage(msgSeq: msgSeq,
        announcement: GameMessage_AnnouncementMsg(games: games));
    connectionHandler.send(message.writeToBuffer(), address, port);
  }

  void sendJoin({
    required InternetAddress address,
    required int port,
    required String gameName,
    required String playerName,
    required NodeRole requestedRole,
    PlayerType playerType = PlayerType.HUMAN,
  }) {
    var message = GameMessage(msgSeq: msgSeq,
    join: GameMessage_JoinMsg(
      playerType: playerType,
      gameName: gameName,
      playerName: playerName,
      requestedRole: requestedRole
    ));
    connectionHandler.send(message.writeToBuffer(), address, port);
  }

  void sendError({
    required InternetAddress address,
    required int port,
    required String errorMsg
  }) {
    var message = GameMessage(msgSeq: msgSeq,
        error: GameMessage_ErrorMsg(errorMessage: errorMsg));
    connectionHandler.send(message.writeToBuffer(), address, port);
  }

  void sendRoleChange({
    required InternetAddress address,
    required int port,
    required NodeRole senderRole,
    required NodeRole receiverRole
  }) {
    var message = GameMessage(msgSeq: msgSeq,
        roleChange: GameMessage_RoleChangeMsg(
            senderRole: senderRole,
            receiverRole: receiverRole
        ));
    connectionHandler.send(message.writeToBuffer(), address, port);
  }

  void sendDiscover() {
    var message = GameMessage(msgSeq: msgSeq,
        discover: GameMessage_DiscoverMsg());
    connectionHandler.multicastSend(message.writeToBuffer());
  }

  void handleMessage(Datagram packet) {
    var message = GameMessage.fromBuffer(packet.data);
    var messageWithSender = MessageWithSender(
        address: packet.address, port: packet.port, gameMessage: message);
    if (message.hasAnnouncement()) {
      announcementsMessages.add(messageWithSender);
    } else if (message.hasPing()) {
      pingMessages.add(messageWithSender);
    } else if (message.hasDiscover()) {
      discoverMessages.add(messageWithSender);
    } else if (message.hasJoin()) {
      joinMessages.add(messageWithSender);
    } else if (message.hasState()) {
      receivedStates.add(messageWithSender);
    } else if (message.hasRoleChange()) {
      roleChangeMessages.add(messageWithSender);
    } else if (message.hasSteer()) {
      steerMessages.add(messageWithSender);
    } else if (message.hasError()) {
      errorMessages.add(messageWithSender);
    } else if (message.hasAck()) {
      ackMessages.add(messageWithSender);
    }
  }
}
