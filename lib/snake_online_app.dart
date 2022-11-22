import 'package:flutter/material.dart';
import 'package:snake_online/screens/main_menu.dart';

class SnakeOnlineApp extends StatelessWidget {
  const SnakeOnlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white
      ),
      home: const MainMenu(),
    );
  }
}
