import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    Button(
                        text: "New game",
                        onTap: () {
                          var config = GameConfig(width: 30, height: 20,
                          stateDelayMs: 250, foodStatic: 30);
                          var player = GamePlayer(name: "aiwannafly", id: 1, role: NodeRole.MASTER);
                          var engine = EngineMaster(config: config, player: player);
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Game(engine: engine, config: config,)));
                        }),
                    Container(),
                  ],
                ),
                const SizedBox(width: Config.maxWidth / 5,),
                const Center(child: GamesList())
              ],
            ),
          ],
        ),
        // const SizedBox(height: Config.margin,),
        // Button(text: "Выйти из игры", onTap: () {
        // }),
      ),
    );
  }
}
