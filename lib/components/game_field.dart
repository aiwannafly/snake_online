import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_online/components/players_list/players_list.dart';
import 'package:snake_online/controller/engine_master.dart';
import 'package:snake_online/model/game/game_state.dart';

import '../controller/engine.dart';
import '../snake.pb.dart';

typedef Snake = GameState_Snake;
typedef Coord = GameState_Coord;

class GameField extends StatefulWidget {
  const GameField({super.key, required this.gameConfig});

  final GameConfig gameConfig;

  @override
  State<GameField> createState() => GameFieldState();
}

class GameFieldState extends State<GameField> {
  static const snakeColors = [
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.blueAccent
  ];

  static const foodColors = [
    Colors.lightGreenAccent,
    Colors.orange,
    Colors.redAccent,
    Colors.white
  ];

  late final GameConfig _gameConfig = widget.gameConfig;
  GameStateMutable? _gameState;
  final Random random = Random();
  late Timer runner;

  @override
  void initState() {
    Engine engine = EngineMaster(config: _gameConfig, renderer: this);
    window.onKeyPress.listen(engine.handlePressedKeyEvent);
    runner = Timer.periodic(Duration(milliseconds: _gameConfig.stateDelayMs), (timer) {
      engine.update();
      engine.render();
      PlayersListState.current?.updatePlayers(_gameState!.players);
    });
    super.initState();
  }

  @override
  void dispose() {
    runner.cancel();
    super.dispose();
  }

  Color get foodColor {
    return foodColors[random.nextInt(foodColors.length)];
  }

  Color get snakeColor {
    return snakeColors[random.nextInt(snakeColors.length)];
  }

  void update(GameStateMutable newState) {
    setState(() {
      _gameState = newState;
    });
  }

  double get cellSize => min(maxWidth / _gameConfig.width,
      maxHeight / _gameConfig.height);

  List<Positioned> get dirtBlocks {
    var res = <Positioned>[];
    for (int x = 0; x < _gameConfig.width; x++) {
      for (int y = 0; y < _gameConfig.height; y++) {
        res.add(Positioned(
          left: cellSize * x,
          top: cellSize * y,
          child: dirt,
        ));
      }
    }
    return res;
  }

  SizedBox get dirt {
    return SizedBox(
      height: cellSize,
      width: cellSize,
      child: Image.asset("assets/images/dirt.jpg"),
    );
  }

  List<Positioned> get blocks {
    if (_gameState == null) return [];
    var res = <Positioned>[];
    for (Coord food in _gameState!.foods) {
      res.add(Positioned(
        left: cellSize * food.x,
        top: cellSize * food.y,
        child: foodView(food.x, food.y),
      ));
    }
    for (Snake snake in _gameState!.snakes) {
      for (Coord snakePoint in snake.points) {
        res.add(Positioned(
            left: cellSize * snakePoint.x,
            top: cellSize * snakePoint.y,
            child: snakePointView));
      }
    }
    return res;
  }

  SizedBox get snakePointView {
    return SizedBox(
      height: cellSize,
      width: cellSize,
      child: Image.asset("assets/images/green_wool.png"),
      // color: snakeColor,
    );
  }

  SizedBox foodView(int x, int y) {
    return SizedBox(
      height: cellSize,
      width: cellSize,
      child: Image.asset("assets/images/${foodName(x, y)}.png"),
      // decoration: BoxDecoration(color: foodColor, shape: BoxShape.circle),
    );
  }

  String foodName(int x, int y) => foodNames[(x + y) % foodNames.length];

  final List<String> foodNames = ["potato", "apple", "golden_apple",
  "carrot", "cookie", "chicken", "steak", "cake"];

  double get maxWidth => 900;
  double get maxHeight => 700;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade700,
      width: cellSize * _gameConfig.width,
      height: cellSize * _gameConfig.height,
      child: Stack(
        children: blocks,
      ),
    );
  }
}
