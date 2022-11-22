///
//  Generated code. Do not modify.
//  source: snake.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NodeRole extends $pb.ProtobufEnum {
  static const NodeRole NORMAL = NodeRole._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NORMAL');
  static const NodeRole MASTER = NodeRole._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MASTER');
  static const NodeRole DEPUTY = NodeRole._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEPUTY');
  static const NodeRole VIEWER = NodeRole._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIEWER');

  static const $core.List<NodeRole> values = <NodeRole> [
    NORMAL,
    MASTER,
    DEPUTY,
    VIEWER,
  ];

  static final $core.Map<$core.int, NodeRole> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NodeRole? valueOf($core.int value) => _byValue[value];

  const NodeRole._($core.int v, $core.String n) : super(v, n);
}

class PlayerType extends $pb.ProtobufEnum {
  static const PlayerType HUMAN = PlayerType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HUMAN');
  static const PlayerType ROBOT = PlayerType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROBOT');

  static const $core.List<PlayerType> values = <PlayerType> [
    HUMAN,
    ROBOT,
  ];

  static final $core.Map<$core.int, PlayerType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PlayerType? valueOf($core.int value) => _byValue[value];

  const PlayerType._($core.int v, $core.String n) : super(v, n);
}

class Direction extends $pb.ProtobufEnum {
  static const Direction UP = Direction._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UP');
  static const Direction DOWN = Direction._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOWN');
  static const Direction LEFT = Direction._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LEFT');
  static const Direction RIGHT = Direction._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RIGHT');

  static const $core.List<Direction> values = <Direction> [
    UP,
    DOWN,
    LEFT,
    RIGHT,
  ];

  static final $core.Map<$core.int, Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Direction? valueOf($core.int value) => _byValue[value];

  const Direction._($core.int v, $core.String n) : super(v, n);
}

class GameState_Snake_SnakeState extends $pb.ProtobufEnum {
  static const GameState_Snake_SnakeState ALIVE = GameState_Snake_SnakeState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALIVE');
  static const GameState_Snake_SnakeState ZOMBIE = GameState_Snake_SnakeState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ZOMBIE');

  static const $core.List<GameState_Snake_SnakeState> values = <GameState_Snake_SnakeState> [
    ALIVE,
    ZOMBIE,
  ];

  static final $core.Map<$core.int, GameState_Snake_SnakeState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GameState_Snake_SnakeState? valueOf($core.int value) => _byValue[value];

  const GameState_Snake_SnakeState._($core.int v, $core.String n) : super(v, n);
}

