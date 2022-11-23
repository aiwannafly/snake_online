import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_online/components/players_list/players_list.dart';
import 'package:snake_online/model/game/game_state.dart';

import '../config.dart';
import '../controller/engine.dart';
import '../model/proto/snake.pb.dart';

typedef Snake = GameState_Snake;
typedef Coord = GameState_Coord;

class GameField extends StatefulWidget {
  const GameField({super.key, required this.gameConfig, required this.engine});

  final GameConfig gameConfig;
  final Engine engine;

  @override
  State<GameField> createState() => GameFieldState();
}

class GameFieldState extends State<GameField> {
  final FocusNode _focusNode = FocusNode();
  late final Function(KeyEvent) handler;
  late final Engine _engine;
  final List<String> foodNames = [
    "potato",
    "apple",
    "golden_apple",
    "carrot",
    "cookie",
    "chicken",
    "steak",
    "cake"
  ];

  final List<String> snakeWools = ["green", "red", "blue"];

  late final GameConfig _gameConfig = widget.gameConfig;
  GameStateMutable? _gameState;
  final Random random = Random();
  late Timer runner;

  @override
  void initState() {
    _engine = widget.engine;
    handler = _engine.handlePressedKeyEvent;
    runner = Timer.periodic(Duration(milliseconds: _gameConfig.stateDelayMs),
        (timer) {
      var newState = _engine.update();
      update(newState);
      PlayersListState.current?.updatePlayers(_gameState!.players);
    });
    super.initState();
  }

  @override
  void dispose() {
    _engine.shutdown();
    runner.cancel();
    super.dispose();
  }

  void update(GameStateMutable newState) {
    setState(() {
      _gameState = newState;
    });
  }

  double get cellSize =>
      min(maxWidth / _gameConfig.width, maxHeight / _gameConfig.height);

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
            child: Container(child: snakePointView(snake.playerId))));
      }
    }
    return res;
  }

  // Direction getTailDir({required Snake snake}) {
  //   if (snake.points.length < 2) return Direction.UP;
  //   var tail = snake.points[snake.points.length - 1];
  //   var tailPrev = snake.points[snake.points.length - 2];
  //   var deltaX = tail.x - tailPrev.x;
  //   var deltaY = tail.y = tailPrev.y;
  //   if (deltaX > 0) return Direction.RIGHT;
  //   if (deltaX < 0) return Direction.LEFT;
  //   if (deltaY > 0) return Direction.UP;
  //   return Direction.DOWN;
  // }

  // var _animate = false;
  //
  // Positioned renderSnakePointAnimated({required Snake snake,
  // required Direction direction, required Coord point}) {
  //   bool horizontal = direction == Direction.LEFT ||
  //       direction == Direction.RIGHT;
  //   var startAlign = Alignment.centerLeft;
  //   var endAlign = Alignment.centerRight;
  //   double leftShift = -cellSize;
  //   double topShift = 0;
  //   if (direction == Direction.LEFT) {
  //     leftShift = 0;
  //     topShift = 0;
  //     startAlign = Alignment.centerRight;
  //     endAlign = Alignment.centerLeft;
  //   } else if (direction == Direction.DOWN) {
  //     leftShift = 0;
  //     topShift = -cellSize;
  //     startAlign = Alignment.topCenter;
  //     endAlign = Alignment.bottomCenter;
  //   } else if (direction == Direction.UP) {
  //     leftShift = 0;
  //     topShift = 0;
  //     startAlign = Alignment.bottomCenter;
  //     endAlign = Alignment.topCenter;
  //   }
  //   return Positioned(
  //     left: cellSize * point.x + leftShift,
  //     top:  cellSize * point.y + topShift,
  //     child: SizedBox(
  //       height: horizontal ? cellSize : 2 * cellSize,
  //       width: horizontal ? 2 * cellSize : cellSize,
  //       child: AnimatedAlign(
  //         alignment: _animate ? endAlign : startAlign,
  //         duration: Duration(milliseconds: _gameConfig.stateDelayMs),
  //         child: snakePointView(snake.playerId),
  //       ),
  //     ),
  //   );
  // }
  //
  // Positioned renderSnakeHead({required Snake snake}) {
  //   return renderSnakePointAnimated(
  //       snake: snake,
  //       direction: snake.headDirection, point: snake.points[0]);
  // }
  //
  // Positioned renderSnakeTail({required Snake snake}) {
  //   return renderSnakePointAnimated(
  //       snake: snake,
  //       direction: getTailDir(snake: snake),
  //       point: snake.points[snake.points.length - 1]);
  // }

  SizedBox snakePointView(int playerId) {
    return SizedBox(
      height: cellSize,
      width: cellSize,
      child: Image.asset("assets/images/${snakeColor(playerId)}_wool.png"),
    );
  }

  SizedBox foodView(int x, int y) {
    return SizedBox(
      height: cellSize,
      width: cellSize,
      child: Image.asset("assets/images/${foodName(x, y)}.png"),
    );
  }

  String snakeColor(int playerId) => snakeWools[playerId % snakeWools.length];

  String foodName(int x, int y) => foodNames[(x + y) % foodNames.length];

  double get maxWidth => Config.pageWidth(context) * 0.65;

  double get maxHeight => Config.pageHeight(context) * 0.8;

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: handler,
      autofocus: true,
      child: Container(
        color: Colors.grey.shade700,
        width: cellSize * _gameConfig.width,
        height: cellSize * _gameConfig.height,
        child: Stack(
          children: blocks,
        ),
      ),
    );
  }
}
