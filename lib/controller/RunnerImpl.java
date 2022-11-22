package ru.aiwannafly.snakeonline.controller;

import javafx.animation.AnimationTimer;
import javafx.scene.Scene;
import javafx.stage.Stage;
import ru.aiwannafly.snakeonline.model.game.GameConfig;
import ru.aiwannafly.snakeonline.model.exceptions.NoSpaceException;

import java.io.IOException;

public class RunnerImpl implements Runner {
    private final Engine engine;
    private final Stage stage;
    private final GameConfig gameConfig;

    public RunnerImpl(Stage stage, GameConfig gameConfig) throws NoSpaceException, IOException {
        this.engine = new EngineImpl(gameConfig);
        this.gameConfig = gameConfig;
        this.stage = stage;
    }

    @Override
    public void run() {
        Scene scene = engine.getRenderer().getScene();
        scene.setOnKeyPressed(engine::handlePressedKeyEvent);
        scene.setOnKeyReleased(engine::handleReleasedKeyEvent);
        scene.setOnMousePressed(engine::handleClickEvent);
        scene.setOnMouseReleased(engine::handleClickReleasedEvent);
        stage.setScene(scene);
        timer.start();
    }

    @Override
    public void stop() {
        timer.stop();
    }

    @Override
    public boolean isActive() {
        return false;
    }

    @Override
    public void playMusic() {
    }

    @Override
    public void stopPlayingMusic() {
    }

    private final AnimationTimer timer = new AnimationTimer() {
        private long lastUpdateTime = 0;

        @Override
        public void handle(long now) {
            if (now - lastUpdateTime >= gameConfig.getStateDelayMs() * 1000000L) {
                animation();
                lastUpdateTime = now;
            }
        }

        private void animation() {
            engine.update();
            engine.render();
        }
    };
}
