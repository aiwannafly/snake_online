import 'package:flutter/cupertino.dart';
import 'package:snake_online/components/game_field.dart';

abstract class Engine {

  void setRenderer(GameFieldState renderer);

  void handlePressedKeyEvent(KeyEvent event);

  void update();

  void shutdown();

  void render();
}
