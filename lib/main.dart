import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake_online/model/network/message_handler.dart';
import 'package:snake_online/snake_online_app.dart';

void main() {
  // StreamController<int> list = StreamController.broadcast();
  // var subscribe = list.stream.listen((event) {
  //   print('added $event');
  // });
  // list.add(2);
  // list.add(3);
  // subscribe.cancel();
  // list.stream.listen((event) {
  //   print('ADDED $event');
  // });
  // list.add(4);
  // list.add(5);
  MessageHandler().initAndStartListening();
  runApp(const SnakeOnlineApp());
}
