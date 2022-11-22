import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake_online/components/button.dart';
import 'package:snake_online/components/games_list/available_games_list.dart';

import '../config.dart';
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
                        text: "Начать новую игру",
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Game()));
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
