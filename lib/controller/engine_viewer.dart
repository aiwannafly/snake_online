import 'package:flutter/cupertino.dart';
import 'package:snake_online/controller/engine_normal.dart';

class EngineViewer extends EngineNormal {

  EngineViewer({required super.config, required super.masterAddress, required super.masterPort,
  required super.playerId});
  
  @override
  void handlePressedKeyEvent(KeyEvent event) {}
}
