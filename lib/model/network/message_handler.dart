import 'dart:io';

import 'package:snake_online/snake.pb.dart';

class MessageWithSender {
  InternetAddress address;
  int port;
  GameMessage gameMessage;

  MessageWithSender({required this.address,
  required this.port, required this.gameMessage});
}

class MessageHandler {
  final List<MessageWithSender> discoverMessages = [];
  final List<MessageWithSender> messageWithSenders = [];
  final List<MessageWithSender> receivedStates = [];
  final List<MessageWithSender> roleChangeMsgs = [];
  final List<MessageWithSender> steerMessages = [];
  final List<MessageWithSender> errorMessages = [];
  final List<MessageWithSender> ackMessages = [];
  int _msgCounter = 0;

  int get msgSeq => _msgCounter++;

  void handleMessage(Datagram packet) {
    var message = GameMessage.fromBuffer(packet.data);
    var messageWithSender = MessageWithSender(
        address: packet.address, port: packet.port, gameMessage: message);
    if (message.hasDiscover()) {
      discoverMessages.add(messageWithSender);
    } else if (message.hasJoin()) {
      messageWithSenders.add(messageWithSender);
    } else if (message.hasState()) {
      receivedStates.add(messageWithSender);
    } else if (message.hasRoleChange()) {
      roleChangeMsgs.add(messageWithSender);
    } else if (message.hasSteer()) {
      steerMessages.add(messageWithSender);
    } else if (message.hasError()) {
      errorMessages.add(messageWithSender);
    } else if (message.hasAck()) {
      ackMessages.add(messageWithSender);
    }
  }
}
