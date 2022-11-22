import 'dart:html';

import 'package:snake_online/components/game_field.dart';
import 'package:snake_online/model/game/game_state.dart';

import '../snake.pb.dart';
import 'engine.dart';

typedef Snake = GameState_Snake;
typedef Coord = GameState_Coord;

class EngineMaster implements Engine {
  final GameFieldState renderer;
  final GameConfig config;
  late GameStateMutable currentState;
  late final GamePlayer player;
  late final Snake playerSnake;
  final List<Snake> removalList = [];
  var movingStarted = false;

  EngineMaster({required this.config, required this.renderer}) {
    player = GamePlayer(name: "aiwannafly", id: 1, role: NodeRole.MASTER);
    currentState = GameStateMutable(config: config);
    currentState.initZeroState(player);
    playerSnake = currentState.snakes[0];
  }

  @override
  void handlePressedKeyEvent(KeyboardEvent event) {
    switch (event.charCode - 32) {
      case KeyCode.W:
        changeDir(Direction.UP);
        break;
      case KeyCode.A:
        changeDir(Direction.LEFT);
        break;
      case KeyCode.S:
        changeDir(Direction.DOWN);
        break;
      case KeyCode.D:
        changeDir(Direction.RIGHT);
        break;
    }
  }

  static Direction opposite(Direction dir) {
    if (dir == Direction.LEFT) return Direction.RIGHT;
    if (dir == Direction.RIGHT) return Direction.LEFT;
    if (dir == Direction.UP) return Direction.DOWN;
    return Direction.UP;
  }

  void changeDir(Direction direction) {
    movingStarted = true;
    if (opposite(direction) == playerSnake.headDirection) return;
    playerSnake.headDirection = direction;
  }

  @override
  void update() {
    int foodEatenCount = 0;
    removalList.clear();
    for (Snake snake in currentState.snakes) {
      if (snake == playerSnake && !movingStarted) continue;
      Coord head = snake.points[0];
      Coord newHead = Coord(x: 0, y: 0);
      switch (snake.headDirection) {
        case Direction.LEFT:
          newHead = Coord(x: GameStateMutable.tor(head.x - 1, config.width), y: head.y);
          break;
        case Direction.RIGHT:
          newHead = Coord(x: GameStateMutable.tor(head.x + 1, config.width), y: head.y);
          break;
        case Direction.DOWN:
          newHead = Coord(x: head.x, y: GameStateMutable.tor(head.y + 1, config.height));
          break;
        case Direction.UP:
          newHead = Coord(x: head.x, y: GameStateMutable.tor(head.y - 1, config.height));
          break;
      }
      bool crossedSnake = false;
      for (Snake playerSnake in currentState.snakes) {
        if (playerSnake.points.contains(newHead)) {
          crossedSnake = true;
          break;
        }
      }
      if (crossedSnake) {
        removalList.add(snake);
        continue;
      }
      if (currentState.foods.contains(newHead)) {
        foodEatenCount++;
        currentState.foods.remove(newHead);
        for (GamePlayer player in currentState.players) {
          if (player.id == snake.playerId) {
            player.score += 1;
            break;
          }
        }
      } else {
        snake.points.removeAt(snake.points.length - 1);
      }
      snake.points.insert(0, newHead);
    }
    for (Snake snake in removalList) {
      currentState.removeSnake(snake);
    }
    currentState.placeFoods(foodEatenCount);
  }

  @override
  void render() {
    renderer.update(currentState);
  }
}
