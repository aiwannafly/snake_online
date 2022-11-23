import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snake_online/components/button.dart';
import 'package:snake_online/components/games_list/available_games_list.dart';

import '../config.dart';
import '../controller/engine_master.dart';
import '../model/proto/snake.pb.dart';
import 'game.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  static AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueGrey.shade900,
      title: const Text(
        "Snake Online",
        style: TextStyle(
            color: Colors.white, fontFamily: Config.fontFamily, fontSize: 32),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Stack(
          children: [
            const Center(
              child: Image(
                  image: AssetImage("assets/images/wallpaper.jpg")
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Container(),
                    Container(),
                    Column(
                      children: [
                        Button(
                            text: "New game",
                            onTap: () => _startNewGame(context)
                        ),
                        const SizedBox(height: Config.margin,),
                        Button(text: "Exit", onTap: () {
                          exit(0);
                        }),
                      ],
                    ),
                    Container(),
                  ],
                ),
                SizedBox(width: Config.pageWidth(context) / 5,),
                const Center(child: GamesList())
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startNewGame(BuildContext context) {
    var config = GameConfig(width: 60, height: 40,
        stateDelayMs: 100, foodStatic: 50);
    var player = GamePlayer(name: "aiwannafly", id: 1, role: NodeRole.MASTER);
    var engine = EngineMaster(config: config, player: player);
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => Game(engine: engine, config: config,)));
  }
}
