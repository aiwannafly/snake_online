import 'package:flutter/material.dart';

import '../../config.dart';
import '../../proto/snake.pb.dart';

class GameListTile extends StatefulWidget {
  const GameListTile({super.key, required this.gameAnnouncement,
  required this.onTap});

  final GameAnnouncement gameAnnouncement;
  final Function(GameAnnouncement) onTap;

  @override
  State<GameListTile> createState() => _GameListTileState();
}

class _GameListTileState extends State<GameListTile> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(widget.gameAnnouncement),
      onHover: (hovered) => setState(() {
        _hovered = hovered;
      }),
      child: AnimatedContainer(
        duration: Config.animationTime,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black87,
              width: 0.2
          ),
          color: !_hovered ? Colors.blueGrey : Colors.blueGrey.shade700,
        ),
        width: 300,
        padding: const EdgeInsets.all(Config.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.gameAnnouncement.gameName,
              style: const TextStyle(
                  fontFamily: Config.fontFamily,
                  fontSize: 20,
                  color: Colors.white70
              ),),
            Text(widget.gameAnnouncement.players.players.length.toString(),
              style: const TextStyle(
                  fontFamily: Config.fontFamily,
                  fontSize: 20,
                  color: Colors.white70
              ),)
          ],
        ),
      ),
    );
  }
}
