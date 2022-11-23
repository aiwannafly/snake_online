import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'dart:io';

import '../../network_config.dart';

class ConnectionHandler {
  late final RawDatagramSocket _multicastSocket;
  late final RawDatagramSocket _unicastSocket;
  late final InternetAddress _group;
  bool _isListening = true;
  final Function(Datagram) handleMessage;
  var _initialized = false;

  ConnectionHandler({required this.handleMessage});

  Future<void> initialize() async {
    _group = InternetAddress(NetworkConfig.groupAddress);
    _multicastSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,
        NetworkConfig.port, reuseAddress: true);
    _unicastSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4,
        0, reuseAddress: true);
    _multicastSocket.joinMulticast(_group);
    _initialized = true;
  }

  void multicastSend(Uint8List buffer) {
    if (!_initialized) throw NotInitializedException();
    send(buffer, _group, NetworkConfig.port);
  }

  void send(Uint8List buffer, InternetAddress address, int port) {
    if (!_initialized) throw NotInitializedException();
    _unicastSocket.send(buffer, address, port);
  }

  void shutdown() {
    if (!_initialized) throw NotInitializedException();
    _isListening = false;
    _multicastSocket.leaveMulticast(_group);
  }

  void listenAll() async {
    listen(_multicastSocket);
    listen(_unicastSocket);
  }

  void listen(RawDatagramSocket socket) async {
    if (!_initialized) throw NotInitializedException();
    _isListening = true;
    while (_isListening) {
      socket.asBroadcastStream().listen((event) {
        Datagram? packet = socket.receive();
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
