import 'dart:math';

import '../../model/proto/snake.pb.dart';

typedef Snake = GameState_Snake;
typedef Coord = GameState_Coord;

class GameStateMutable {
  static const int newSnakeAreaSize = 5;
  static final Random random = Random();

  List<Coord> foods = [];
  List<Snake> snakes = [];
  List<GamePlayer> players = [];
  final GameConfig config;
  int stateOrder;

  GameStateMutable({required this.config, this.stateOrder = 0});

  void placeFoods(int foodCount) {
    for (int i = 0; i < foodCount; i++) {
      if (foods.length == config.height * config.width) {
        break;
      }
      Coord newFood = generateRandomCoord;
      while (foods.contains(newFood)) {
        newFood = generateRandomCoord;
      }
      foods.add(newFood);
    }
  }

  void initZeroState(GamePlayer player) {
    placeFoods(config.foodStatic);
    Snake playersSnake = getNewSnake(player.id);
    snakes.add(playersSnake);
    players.add(player);
  }

  Snake getNewSnake(int playerId) {
    int? x;
    int? y;
    Coord startSearchPoint = generateRandomCoord;
    for (int i = 0; i < config.height && y == null; i++) {
      for (int j = 0; j < config.width && x == null; j++) {
        if (isFreeArea(startSearchPoint.x + i, startSearchPoint.y + j,
            (newSnakeAreaSize / 2).floor())) {
          x = startSearchPoint.x + i;
          y = startSearchPoint.y + j;
        }
      }
    }
    if (x == null || y == null) {
      throw NoSpaceException();
    }
    Snake snake = Snake(playerId: playerId);
    Coord tail = Coord(x: x, y: y);
    Coord right = Coord(x: torX(x + 1), y: y);
    Coord left = Coord(x: torX(x - 1), y: y);
    Coord top = Coord(x: x, y: torY(y - 1));
    Coord bottom = Coord(x: x, y: torY(y + 1));
    Coord head = !foods.contains(top)
        ? top
        : !foods.contains(bottom)
        ? bottom
        : !foods.contains(right)
        ? right
        : left;
    snake.points.add(head);
    snake.points.add(tail);
    return snake;
  }

  Coord get generateRandomCoord {
    return Coord(
        x: random.nextInt(config.width),
        y: random.nextInt(config.height));
  }

  static int tor(int a, int bound) {
    while (a >= bound) {
      a -= bound;
    }
    while (a < 0) {
      a += bound;
    }
    return a;
  }

  int torX(int x) {
    return tor(x, config.width);
  }

  int torY(int y) {
    return tor(y, config.height);
  }

  void removeSnake(Snake snake) {
    if (!snakes.contains(snake)) return;
    for (Coord point in snake.points) {
      if (random.nextInt(2) == 1) {
        foods.add(point);
      }
    }
    snakes.remove(snake);
  }

  bool isFreeArea(
      int x, int y, int radius) {
    for (int i = -radius; i <= radius; i++) {
      for (int j = -radius; j <= radius; j++) {
        int cx = torX(x + j);
        int cy = torY(y + i);
        Coord point = Coord(x: cx, y: cy);
        if (!isFoodFree(cx, cy)) return false;
        for (Snake snake in snakes) {
          if (snake.points.contains(point)) return false;
        }
      }
    }
    return true;
  }

  bool isFoodFree(int x, int y) {
    if (foods.contains(Coord(x: x, y: y))) return false;
    if (!foods.contains(Coord(x: torX(x + 1), y: y))) return true;
    if (!foods.contains(Coord(x: torX(x - 1), y: y))) return true;
    if (!foods.contains(Coord(x: x, y: torY(y + 1)))) return true;
    if (!foods.contains(Coord(x: x, y: torY(y - 1)))) return true;
    return false;
  }
}

class NoSpaceException {}
