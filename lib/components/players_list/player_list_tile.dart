import 'package:flutter/material.dart';

import '../../config.dart';
import '../../snake.pb.dart';

class PlayerListTile extends StatelessWidget {
  const PlayerListTile({super.key, required this.gamePlayer});

  final GamePlayer gamePlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Config.borderRadius),
        border: Border.all(
          color: Colors.black87,
          width: 0.2
        ),
        color: Colors.blueGrey.shade800,
      ),
      width: 400,
      padding: const EdgeInsets.all(Config.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(gamePlayer.name,
          style: const TextStyle(
            fontFamily: Config.fontFamily,
            fontSize: 20,
            color: Colors.white
          ),),
          Text(gamePlayer.score.toString(),
            style: const TextStyle(
                fontFamily: Config.fontFamily,
                fontSize: 20,
                color: Colors.white
            ),)
        ],
      ),
    );
  }
}
