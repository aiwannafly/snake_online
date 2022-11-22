import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_online/components/games_list/game_list_tile.dart';
import 'package:snake_online/model/network/message_handler.dart';

import '../../config.dart';
import '../../model/proto/snake.pb.dart';
import '../button.dart';

class GamesList extends StatefulWidget {
  const GamesList({super.key});

  @override
  State<GamesList> createState() => GamesListState();
}

class GamesListState extends State<GamesList> {
  GameAnnouncement? _chosenGame;
  final Set<GameAnnouncement> _currentGames = {};
  final Map<String, MessageWithSender> _gameNames = {};

  @override
  void initState() {
    MessageHandler().announcementsMessages.stream.listen((event) {
      var games = event.gameMessage.announcement.games;
      for (GameAnnouncement game in games) {
        if (_gameNames.keys.contains(game.gameName)) {
          continue;
        }
        _gameNames[game.gameName] = event;
        _currentGames.add(game);
        setState(() {
        });
      }
    });
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
                  "Available games",
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
                      _chosenGame = gameAnnouncement;
                    });
                  },
                )).toList(),
              ),
            ],
          ),
          _chosenGame != null
              ? Button(
            text: "Join ${_chosenGame!.gameName}",
            onTap: () {
              var name = _chosenGame!.gameName;
              MessageHandler().sendJoin(
                  address: _gameNames[name]!.address,
                  port: _gameNames[name]!.port,
                  gameName: name,
                  playerName: "winner${Random().nextInt(1000)}",
                  requestedRole: NodeRole.NORMAL
              );
              debugPrint('send join to ${_gameNames[name]!.address.address} :'
                  '${_gameNames[name]!.port}');
            },
          )
              : Container()
        ],
      ),
    );
  }
}
