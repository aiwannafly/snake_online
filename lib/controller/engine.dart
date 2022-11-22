import 'dart:html';

abstract class Engine {

    void handlePressedKeyEvent(KeyboardEvent event);

    void update();

    void render();
}
