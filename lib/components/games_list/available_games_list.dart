import 'package:flutter/material.dart';
import 'package:snake_online/components/games_list/game_list_tile.dart';

import '../../config.dart';
import '../../proto/snake.pb.dart';
import '../button.dart';

class GamesList extends StatefulWidget {
  const GamesList({super.key});

  @override
  State<GamesList> createState() => GamesListState();
}

class GamesListState extends State<GamesList> {
  var _gameIsChosen = false;
  List<GameAnnouncement> _currentGames = [
    GameAnnouncement(
        players: GamePlayers(players : [GamePlayer(name: "Bob", id: 241, role: NodeRole.MASTER)]),
        config: GameConfig(width: 30, height: 40, foodStatic: 15),
        gameName: "Some game")
  ];
  static GamesListState? current;

  void updatePlayers(List<GameAnnouncement> players) {
    setState(() {
      _currentGames = players;
    });
  }

  @override
  void initState() {
    current = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Config.borderRadius),
          color: Colors.blueGrey.shade900.withOpacity(0.9)),
      margin: const EdgeInsets.all(Config.padding),
      padding: const EdgeInsets.all(Config.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: 300,
                decoration: BoxDecoration(color: Colors.blueGrey.shade700),
                padding: const EdgeInsets.all(Config.padding),
                child: const Text(
                  "Список идущих игр",
                  style: TextStyle(
                      fontFamily: Config.fontFamily,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Column(
                children: _currentGames
                    .map((e) => GameListTile(
                  gameAnnouncement: e,
                  onTap: (gameAnnouncement) {
                    setState(() {
                      _gameIsChosen = true;
                    });
                  },
                ))
                    .toList(),
              ),
            ],
          ),
          _gameIsChosen
              ? Button(
            text: "Присоединиться",
            onTap: () {},
          )
              : Container()
        ],
      ),
    );
  }
}
