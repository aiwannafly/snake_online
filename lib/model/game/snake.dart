// import 'dart:core';
//
// import 'coord.dart';
//
// enum Direction {
//     UP, DOWN, LEFT, RIGHT;
//
//     Direction opposite() {
//         if (this == LEFT) return RIGHT;
//         if (this == RIGHT) return LEFT;
//         if (this == UP) return DOWN;
//         return UP;
//     }
// }
//
// enum SnakeState {
//     ALIVE, ZOMBIE
// }
//
// class Snake {
//     final int playerId;
//     final List<Coord> points = [];
//     SnakeState state;
//     Direction headDirection;
//
//     Snake({required this.playerId, this.headDirection = Direction.UP,
//         this.state = SnakeState.ALIVE});
// }
//
