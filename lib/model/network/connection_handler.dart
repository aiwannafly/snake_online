import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'dart:io';

import '../../network_config.dart';

class ConnectionHandler {
  late final RawDatagramSocket _recSocket;
  late final RawDatagramSocket _sendSocket;
  late final InternetAddress _group;
  bool _isListening = true;
  final Function(Datagram) handleMessage;
  var _initialized = false;

  ConnectionHandler({required this.handleMessage});

  Future<void> initialize() async {
    _group = InternetAddress(NetworkConfig.groupAddr);
    _recSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,
        NetworkConfig.port, reuseAddress: true);
    _sendSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,
        0, reuseAddress: true);
    _recSocket.joinMulticast(_group);
    _initialized = true;
  }

  void multicastSend(Uint8List buffer) {
    if (!_initialized) throw NotInitializedException();
    send(buffer, _group, NetworkConfig.port);
  }

  void send(Uint8List buffer, InternetAddress address, int port) {
    if (!_initialized) throw NotInitializedException();
    _sendSocket.send(buffer, address, port);
  }

  void shutdown() {
    if (!_initialized) throw NotInitializedException();
    _isListening = false;
    _recSocket.leaveMulticast(_group);
  }

  void listen() async {
    if (!_initialized) throw NotInitializedException();
    _isListening = true;
    while (_isListening) {
      _recSocket.listen((event) {
        Datagram? packet = _recSocket.receive();
        if (packet == null) {
          debugPrint("receive() returned null-datagram");
        } else {
          handleMessage(packet);
        }
      },
      onError: (error) {
        debugPrint('error occurred in listen(): ${error.toString()}');
      });
    }
  }
}

class NotInitializedException {}
