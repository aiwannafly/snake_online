import 'package:flutter/material.dart';
import 'package:snake_online/model/network/message_handler.dart';
import 'package:snake_online/snake_online_app.dart';

void main() {
  MessageHandler().initAndStartListening();
  runApp(const SnakeOnlineApp());
}
