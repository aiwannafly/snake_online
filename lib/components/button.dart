import 'package:flutter/material.dart';

import '../config.dart';

class Button extends StatefulWidget {
  const Button({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  State<StatefulWidget> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hovered) => setState(() {
        _hovered = hovered;
      }),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Config.animationTime,
        // width: 300,
        height: 50.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: !_hovered ? Colors.blueGrey.shade900 :
            Colors.grey.shade900,
          borderRadius: BorderRadius.circular(Config.borderRadius),
          boxShadow: !_hovered
            ? []
            : [
              const BoxShadow(
                color: Colors.lightGreenAccent,
                blurRadius: 15
              )
              ]
        ),
        padding: const EdgeInsets.all(Config.padding / 2),
        margin: const EdgeInsets.all(Config.padding),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: Config.fontFamily,
            fontSize: 24
          ),
        ),
      ),
    );
  }
}
