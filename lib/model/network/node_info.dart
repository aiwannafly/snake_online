import 'package:snake_online/model/proto/snake.pb.dart';

class NodeInfo {
  GamePlayer player;
  DateTime lastMsgTime = DateTime.now();

  NodeInfo({required this.player});
}
