import 'package:flutter/cupertino.dart';
import 'package:snake_online/model/game/game_state.dart';

abstract class Engine {

  void handlePressedKeyEvent(KeyEvent event);

  GameStateMutable update();

  void shutdown();
}
