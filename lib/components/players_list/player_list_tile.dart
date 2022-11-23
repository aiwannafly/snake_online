import 'package:flutter/material.dart';

import '../../config.dart';
import '../../model/proto/snake.pb.dart';

class PlayerListTile extends StatelessWidget {
  const PlayerListTile({super.key, required this.gamePlayer});

  final GamePlayer gamePlayer;

  @override
  Widget build(BuildContext context) {
    Color textColor = gamePlayer.role == NodeRole.VIEWER ?
        Colors.white70 : Colors.white;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Config.borderRadius),
        border: Border.all(
          color: Colors.black87,
          width: 0.2
        ),
        color: Colors.blueGrey.shade800,
      ),
      width: Config.pageWidth(context) / 4,
      padding: const EdgeInsets.all(Config.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(gamePlayer.name,
          style: TextStyle(
            fontFamily: Config.fontFamily,
            fontSize: 20,
            color: textColor
          ),),
          Text(gamePlayer.score.toString(),
            style: TextStyle(
                fontFamily: Config.fontFamily,
                fontSize: 20,
                color: textColor
            ),)
        ],
      ),
    );
  }
}
