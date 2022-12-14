import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_online/components/games_list/game_list_tile.dart';
import 'package:snake_online/controller/engine_normal.dart';
import 'package:snake_online/model/network/message_handler.dart';

import '../../config.dart';
import '../../model/proto/snake.pb.dart';
import '../../screens/game.dart';
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
  final Map<String, GameConfig> _gameConfigs = {};
  StreamSubscription<MessageWithSender>? _ackSubscription;
  StreamSubscription<MessageWithSender>? _errorSubscription;
  late Timer _checkAnnouncementsTimer;

  @override
  void initState() {
    _checkAnnouncementsTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) async {
      _currentGames.clear();
      var messages = MessageHandler().announcementsMessages;
      // print(messages.length);
      for (MessageWithSender message in messages) {
        var games = message.gameMessage.announcement.games;
        for (GameAnnouncement game in games) {
          _gameNames[game.gameName] = message;
          _gameConfigs[game.gameName] = game.config;
          _currentGames.add(game);
        }
      }
      MessageHandler().announcementsMessages.clear();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _checkAnnouncementsTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Config.borderRadius),
          color: Colors.blueGrey.shade900.withOpacity(0.9)),
      margin: const EdgeInsets.all(Config.padding),
      padding: const EdgeInsets.all(Config.padding),
      height: Config.pageHeight(context) * 0.8,
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: Config.pageWidth(context) / 4,
                      decoration:
                          BoxDecoration(color: Colors.blueGrey.shade700),
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
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _chosenGame != null
              ? Column(
                  children: [
                    Button(
                        text: "Join as player",
                        onTap: () => _joinToGame(context, NodeRole.NORMAL)),
                    Button(
                        text: "Join as viewer",
                        onTap: () => _joinToGame(context, NodeRole.VIEWER)),
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  void _joinToGame(BuildContext context, NodeRole nodeRole) {
    assert(nodeRole == NodeRole.VIEWER || nodeRole == NodeRole.NORMAL);
    var name = _chosenGame!.gameName;
    var masterAddress = _gameNames[name]!.address;
    var masterPort = _gameNames[name]!.port;
    MessageHandler().sendJoin(
        address: masterAddress,
        port: masterPort,
        gameName: name,
        playerName: "winner${Random().nextInt(1000)}",
        requestedRole: nodeRole);
    debugPrint('send join to ${_gameNames[name]!.address.address} :'
        '${_gameNames[name]!.port}');
    if (_ackSubscription != null) {
      _ackSubscription!.resume();
      return;
    }
    _ackSubscription = MessageHandler().ackMessages.stream.listen((event) {
      if (event.address != masterAddress || event.port != masterPort) return;
      int playerId = event.gameMessage.receiverId;
      var config = _gameConfigs[name]!;
      var engine = EngineNormal(
          config: config,
          masterAddress: masterAddress,
          masterPort: masterPort,
          playerId: playerId);
      _ackSubscription!.pause();
      _chosenGame = null;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Game(
                engine: engine,
                config: config,
              )));
    });
  }
}
