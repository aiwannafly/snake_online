import 'package:flutter/cupertino.dart';

abstract class Engine {

    void handlePressedKeyEvent(KeyEvent event);

    void update();

    void shutdown();

    void render();
}
