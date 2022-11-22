import 'package:flutter/material.dart';
import 'package:snake_online/components/game_field.dart';
import 'package:snake_online/components/players_list/players_list.dart';
import 'package:snake_online/screens/main_menu.dart';

import '../components/button.dart';
import '../config.dart';
import '../proto/snake.pb.dart';

class Game extends StatelessWidget {
  Game({super.key});
  final GameConfig config = GameConfig(width: 30, height: 20,
    foodStatic: 30, stateDelayMs: 250);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainMenu.buildAppBar(),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Config.borderRadius)
          ),
          margin: const EdgeInsets.all(Config.margin),
          alignment: Alignment.center,
          child: Row(
            children: [
              GameField(gameConfig: config),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PlayersList(),
                  Button(text: "Выйти", onTap: () {
                    Navigator.of(context).pop();
                  },)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
