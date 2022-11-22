import 'package:flutter/material.dart';
import 'package:snake_online/components/players_list/player_list_tile.dart';

import '../../config.dart';
import '../../snake.pb.dart';

class PlayersList extends StatefulWidget {
  const PlayersList({super.key});

  @override
  State<PlayersList> createState() => PlayersListState();
}

class PlayersListState extends State<PlayersList> {
  List<GamePlayer> _currentPlayers = [];
  static PlayersListState? current;

  void updatePlayers(List<GamePlayer> players) {
    setState(() {
      _currentPlayers = players;
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
      padding: const EdgeInsets.all(Config.padding),
      child: Column(
        children: [
          Container(
            width: 400,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(Config.borderRadius)
            ),
            padding: const EdgeInsets.all(Config.padding),
            child: const Text(
              "Список игроков",
              style: TextStyle(
                  fontFamily: Config.fontFamily,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          Column(
            children: _currentPlayers
                .map((e) => PlayerListTile(gamePlayer: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}
