///
//  Generated code. Do not modify.
//  source: snake.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'snake.pbenum.dart';

export 'snake.pbenum.dart';

class GamePlayer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GamePlayer', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.Q3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ipAddress')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'port', $pb.PbFieldType.O3)
    ..e<NodeRole>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', $pb.PbFieldType.QE, defaultOrMaker: NodeRole.NORMAL, valueOf: NodeRole.valueOf, enumValues: NodeRole.values)
    ..e<PlayerType>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PlayerType.HUMAN, valueOf: PlayerType.valueOf, enumValues: PlayerType.values)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'score', $pb.PbFieldType.Q3)
  ;

  GamePlayer._() : super();
  factory GamePlayer({
    $core.String? name,
    $core.int? id,
    $core.String? ipAddress,
    $core.int? port,
    NodeRole? role,
    PlayerType? type,
    $core.int? score,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (ipAddress != null) {
      _result.ipAddress = ipAddress;
    }
    if (port != null) {
      _result.port = port;
    }
    if (role != null) {
      _result.role = role;
    }
    if (type != null) {
      _result.type = type;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory GamePlayer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GamePlayer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GamePlayer clone() => GamePlayer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GamePlayer copyWith(void Function(GamePlayer) updates) => super.copyWith((message) => updates(message as GamePlayer)) as GamePlayer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamePlayer create() => GamePlayer._();
  GamePlayer createEmptyInstance() => create();
  static $pb.PbList<GamePlayer> createRepeated() => $pb.PbList<GamePlayer>();
  @$core.pragma('dart2js:noInline')
  static GamePlayer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GamePlayer>(create);
  static GamePlayer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ipAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set ipAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIpAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearIpAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get port => $_getIZ(3);
  @$pb.TagNumber(4)
  set port($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPort() => $_has(3);
  @$pb.TagNumber(4)
  void clearPort() => clearField(4);

  @$pb.TagNumber(5)
  NodeRole get role => $_getN(4);
  @$pb.TagNumber(5)
  set role(NodeRole v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$pb.TagNumber(6)
  PlayerType get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(PlayerType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get score => $_getIZ(6);
  @$pb.TagNumber(7)
  set score($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);
}

class GameConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameConfig', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width', $pb.PbFieldType.O3, defaultOrMaker: 40)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.O3, defaultOrMaker: 30)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foodStatic', $pb.PbFieldType.O3, defaultOrMaker: 1)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stateDelayMs', $pb.PbFieldType.O3, defaultOrMaker: 1000)
    ..hasRequiredFields = false
  ;

  GameConfig._() : super();
  factory GameConfig({
    $core.int? width,
    $core.int? height,
    $core.int? foodStatic,
    $core.int? stateDelayMs,
  }) {
    final _result = create();
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (foodStatic != null) {
      _result.foodStatic = foodStatic;
    }
    if (stateDelayMs != null) {
      _result.stateDelayMs = stateDelayMs;
    }
    return _result;
  }
  factory GameConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameConfig clone() => GameConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameConfig copyWith(void Function(GameConfig) updates) => super.copyWith((message) => updates(message as GameConfig)) as GameConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameConfig create() => GameConfig._();
  GameConfig createEmptyInstance() => create();
  static $pb.PbList<GameConfig> createRepeated() => $pb.PbList<GameConfig>();
  @$core.pragma('dart2js:noInline')
  static GameConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameConfig>(create);
  static GameConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get width => $_getI(0, 40);
  @$pb.TagNumber(1)
  set width($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get height => $_getI(1, 30);
  @$pb.TagNumber(2)
  set height($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get foodStatic => $_getI(2, 1);
  @$pb.TagNumber(3)
  set foodStatic($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFoodStatic() => $_has(2);
  @$pb.TagNumber(3)
  void clearFoodStatic() => clearField(3);

  @$pb.TagNumber(5)
  $core.int get stateDelayMs => $_getI(3, 1000);
  @$pb.TagNumber(5)
  set stateDelayMs($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasStateDelayMs() => $_has(3);
  @$pb.TagNumber(5)
  void clearStateDelayMs() => clearField(5);
}

class GamePlayers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GamePlayers', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..pc<GamePlayer>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'players', $pb.PbFieldType.PM, subBuilder: GamePlayer.create)
  ;

  GamePlayers._() : super();
  factory GamePlayers({
    $core.Iterable<GamePlayer>? players,
  }) {
    final _result = create();
    if (players != null) {
      _result.players.addAll(players);
    }
    return _result;
  }
  factory GamePlayers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GamePlayers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GamePlayers clone() => GamePlayers()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GamePlayers copyWith(void Function(GamePlayers) updates) => super.copyWith((message) => updates(message as GamePlayers)) as GamePlayers; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamePlayers create() => GamePlayers._();
  GamePlayers createEmptyInstance() => create();
  static $pb.PbList<GamePlayers> createRepeated() => $pb.PbList<GamePlayers>();
  @$core.pragma('dart2js:noInline')
  static GamePlayers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GamePlayers>(create);
  static GamePlayers? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GamePlayer> get players => $_getList(0);
}

class GameState_Coord extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameState.Coord', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OS3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OS3)
    ..hasRequiredFields = false
  ;

  GameState_Coord._() : super();
  factory GameState_Coord({
    $core.int? x,
    $core.int? y,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    return _result;
  }
  factory GameState_Coord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameState_Coord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameState_Coord clone() => GameState_Coord()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameState_Coord copyWith(void Function(GameState_Coord) updates) => super.copyWith((message) => updates(message as GameState_Coord)) as GameState_Coord; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameState_Coord create() => GameState_Coord._();
  GameState_Coord createEmptyInstance() => create();
  static $pb.PbList<GameState_Coord> createRepeated() => $pb.PbList<GameState_Coord>();
  @$core.pragma('dart2js:noInline')
  static GameState_Coord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameState_Coord>(create);
  static GameState_Coord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class GameState_Snake extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameState.Snake', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerId', $pb.PbFieldType.Q3)
    ..pc<GameState_Coord>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'points', $pb.PbFieldType.PM, subBuilder: GameState_Coord.create)
    ..e<GameState_Snake_SnakeState>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.QE, defaultOrMaker: GameState_Snake_SnakeState.ALIVE, valueOf: GameState_Snake_SnakeState.valueOf, enumValues: GameState_Snake_SnakeState.values)
    ..e<Direction>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headDirection', $pb.PbFieldType.QE, defaultOrMaker: Direction.UP, valueOf: Direction.valueOf, enumValues: Direction.values)
  ;

  GameState_Snake._() : super();
  factory GameState_Snake({
    $core.int? playerId,
    $core.Iterable<GameState_Coord>? points,
    GameState_Snake_SnakeState? state,
    Direction? headDirection,
  }) {
    final _result = create();
    if (playerId != null) {
      _result.playerId = playerId;
    }
    if (points != null) {
      _result.points.addAll(points);
    }
    if (state != null) {
      _result.state = state;
    }
    if (headDirection != null) {
      _result.headDirection = headDirection;
    }
    return _result;
  }
  factory GameState_Snake.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameState_Snake.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameState_Snake clone() => GameState_Snake()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameState_Snake copyWith(void Function(GameState_Snake) updates) => super.copyWith((message) => updates(message as GameState_Snake)) as GameState_Snake; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameState_Snake create() => GameState_Snake._();
  GameState_Snake createEmptyInstance() => create();
  static $pb.PbList<GameState_Snake> createRepeated() => $pb.PbList<GameState_Snake>();
  @$core.pragma('dart2js:noInline')
  static GameState_Snake getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameState_Snake>(create);
  static GameState_Snake? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GameState_Coord> get points => $_getList(1);

  @$pb.TagNumber(3)
  GameState_Snake_SnakeState get state => $_getN(2);
  @$pb.TagNumber(3)
  set state(GameState_Snake_SnakeState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  Direction get headDirection => $_getN(3);
  @$pb.TagNumber(4)
  set headDirection(Direction v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeadDirection() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeadDirection() => clearField(4);
}

class GameState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stateOrder', $pb.PbFieldType.Q3)
    ..pc<GameState_Snake>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'snakes', $pb.PbFieldType.PM, subBuilder: GameState_Snake.create)
    ..pc<GameState_Coord>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'foods', $pb.PbFieldType.PM, subBuilder: GameState_Coord.create)
    ..aQM<GamePlayers>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'players', subBuilder: GamePlayers.create)
  ;

  GameState._() : super();
  factory GameState({
    $core.int? stateOrder,
    $core.Iterable<GameState_Snake>? snakes,
    $core.Iterable<GameState_Coord>? foods,
    GamePlayers? players,
  }) {
    final _result = create();
    if (stateOrder != null) {
      _result.stateOrder = stateOrder;
    }
    if (snakes != null) {
      _result.snakes.addAll(snakes);
    }
    if (foods != null) {
      _result.foods.addAll(foods);
    }
    if (players != null) {
      _result.players = players;
    }
    return _result;
  }
  factory GameState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameState clone() => GameState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameState copyWith(void Function(GameState) updates) => super.copyWith((message) => updates(message as GameState)) as GameState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameState create() => GameState._();
  GameState createEmptyInstance() => create();
  static $pb.PbList<GameState> createRepeated() => $pb.PbList<GameState>();
  @$core.pragma('dart2js:noInline')
  static GameState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameState>(create);
  static GameState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get stateOrder => $_getIZ(0);
  @$pb.TagNumber(1)
  set stateOrder($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStateOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearStateOrder() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GameState_Snake> get snakes => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<GameState_Coord> get foods => $_getList(2);

  @$pb.TagNumber(4)
  GamePlayers get players => $_getN(3);
  @$pb.TagNumber(4)
  set players(GamePlayers v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlayers() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayers() => clearField(4);
  @$pb.TagNumber(4)
  GamePlayers ensurePlayers() => $_ensure(3);
}

class GameAnnouncement extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameAnnouncement', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..aQM<GamePlayers>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'players', subBuilder: GamePlayers.create)
    ..aQM<GameConfig>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'config', subBuilder: GameConfig.create)
    ..a<$core.bool>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'canJoin', $pb.PbFieldType.OB, defaultOrMaker: true)
    ..aQS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameName')
  ;

  GameAnnouncement._() : super();
  factory GameAnnouncement({
    GamePlayers? players,
    GameConfig? config,
    $core.bool? canJoin,
    $core.String? gameName,
  }) {
    final _result = create();
    if (players != null) {
      _result.players = players;
    }
    if (config != null) {
      _result.config = config;
    }
    if (canJoin != null) {
      _result.canJoin = canJoin;
    }
    if (gameName != null) {
      _result.gameName = gameName;
    }
    return _result;
  }
  factory GameAnnouncement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameAnnouncement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameAnnouncement clone() => GameAnnouncement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameAnnouncement copyWith(void Function(GameAnnouncement) updates) => super.copyWith((message) => updates(message as GameAnnouncement)) as GameAnnouncement; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameAnnouncement create() => GameAnnouncement._();
  GameAnnouncement createEmptyInstance() => create();
  static $pb.PbList<GameAnnouncement> createRepeated() => $pb.PbList<GameAnnouncement>();
  @$core.pragma('dart2js:noInline')
  static GameAnnouncement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameAnnouncement>(create);
  static GameAnnouncement? _defaultInstance;

  @$pb.TagNumber(1)
  GamePlayers get players => $_getN(0);
  @$pb.TagNumber(1)
  set players(GamePlayers v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayers() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayers() => clearField(1);
  @$pb.TagNumber(1)
  GamePlayers ensurePlayers() => $_ensure(0);

  @$pb.TagNumber(2)
  GameConfig get config => $_getN(1);
  @$pb.TagNumber(2)
  set config(GameConfig v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => clearField(2);
  @$pb.TagNumber(2)
  GameConfig ensureConfig() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get canJoin => $_getB(2, true);
  @$pb.TagNumber(3)
  set canJoin($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCanJoin() => $_has(2);
  @$pb.TagNumber(3)
  void clearCanJoin() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gameName => $_getSZ(3);
  @$pb.TagNumber(4)
  set gameName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGameName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameName() => clearField(4);
}

class GameMessage_PingMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.PingMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GameMessage_PingMsg._() : super();
  factory GameMessage_PingMsg() => create();
  factory GameMessage_PingMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_PingMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_PingMsg clone() => GameMessage_PingMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_PingMsg copyWith(void Function(GameMessage_PingMsg) updates) => super.copyWith((message) => updates(message as GameMessage_PingMsg)) as GameMessage_PingMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_PingMsg create() => GameMessage_PingMsg._();
  GameMessage_PingMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_PingMsg> createRepeated() => $pb.PbList<GameMessage_PingMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_PingMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_PingMsg>(create);
  static GameMessage_PingMsg? _defaultInstance;
}

class GameMessage_SteerMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.SteerMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..e<Direction>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'direction', $pb.PbFieldType.QE, defaultOrMaker: Direction.UP, valueOf: Direction.valueOf, enumValues: Direction.values)
  ;

  GameMessage_SteerMsg._() : super();
  factory GameMessage_SteerMsg({
    Direction? direction,
  }) {
    final _result = create();
    if (direction != null) {
      _result.direction = direction;
    }
    return _result;
  }
  factory GameMessage_SteerMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_SteerMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_SteerMsg clone() => GameMessage_SteerMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_SteerMsg copyWith(void Function(GameMessage_SteerMsg) updates) => super.copyWith((message) => updates(message as GameMessage_SteerMsg)) as GameMessage_SteerMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_SteerMsg create() => GameMessage_SteerMsg._();
  GameMessage_SteerMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_SteerMsg> createRepeated() => $pb.PbList<GameMessage_SteerMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_SteerMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_SteerMsg>(create);
  static GameMessage_SteerMsg? _defaultInstance;

  @$pb.TagNumber(1)
  Direction get direction => $_getN(0);
  @$pb.TagNumber(1)
  set direction(Direction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDirection() => $_has(0);
  @$pb.TagNumber(1)
  void clearDirection() => clearField(1);
}

class GameMessage_AckMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.AckMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GameMessage_AckMsg._() : super();
  factory GameMessage_AckMsg() => create();
  factory GameMessage_AckMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_AckMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_AckMsg clone() => GameMessage_AckMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_AckMsg copyWith(void Function(GameMessage_AckMsg) updates) => super.copyWith((message) => updates(message as GameMessage_AckMsg)) as GameMessage_AckMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_AckMsg create() => GameMessage_AckMsg._();
  GameMessage_AckMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_AckMsg> createRepeated() => $pb.PbList<GameMessage_AckMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_AckMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_AckMsg>(create);
  static GameMessage_AckMsg? _defaultInstance;
}

class GameMessage_StateMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.StateMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..aQM<GameState>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', subBuilder: GameState.create)
  ;

  GameMessage_StateMsg._() : super();
  factory GameMessage_StateMsg({
    GameState? state,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory GameMessage_StateMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_StateMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_StateMsg clone() => GameMessage_StateMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_StateMsg copyWith(void Function(GameMessage_StateMsg) updates) => super.copyWith((message) => updates(message as GameMessage_StateMsg)) as GameMessage_StateMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_StateMsg create() => GameMessage_StateMsg._();
  GameMessage_StateMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_StateMsg> createRepeated() => $pb.PbList<GameMessage_StateMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_StateMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_StateMsg>(create);
  static GameMessage_StateMsg? _defaultInstance;

  @$pb.TagNumber(1)
  GameState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(GameState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
  @$pb.TagNumber(1)
  GameState ensureState() => $_ensure(0);
}

class GameMessage_AnnouncementMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.AnnouncementMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..pc<GameAnnouncement>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'games', $pb.PbFieldType.PM, subBuilder: GameAnnouncement.create)
  ;

  GameMessage_AnnouncementMsg._() : super();
  factory GameMessage_AnnouncementMsg({
    $core.Iterable<GameAnnouncement>? games,
  }) {
    final _result = create();
    if (games != null) {
      _result.games.addAll(games);
    }
    return _result;
  }
  factory GameMessage_AnnouncementMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_AnnouncementMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_AnnouncementMsg clone() => GameMessage_AnnouncementMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_AnnouncementMsg copyWith(void Function(GameMessage_AnnouncementMsg) updates) => super.copyWith((message) => updates(message as GameMessage_AnnouncementMsg)) as GameMessage_AnnouncementMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_AnnouncementMsg create() => GameMessage_AnnouncementMsg._();
  GameMessage_AnnouncementMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_AnnouncementMsg> createRepeated() => $pb.PbList<GameMessage_AnnouncementMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_AnnouncementMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_AnnouncementMsg>(create);
  static GameMessage_AnnouncementMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GameAnnouncement> get games => $_getList(0);
}

class GameMessage_DiscoverMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.DiscoverMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GameMessage_DiscoverMsg._() : super();
  factory GameMessage_DiscoverMsg() => create();
  factory GameMessage_DiscoverMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_DiscoverMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_DiscoverMsg clone() => GameMessage_DiscoverMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_DiscoverMsg copyWith(void Function(GameMessage_DiscoverMsg) updates) => super.copyWith((message) => updates(message as GameMessage_DiscoverMsg)) as GameMessage_DiscoverMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_DiscoverMsg create() => GameMessage_DiscoverMsg._();
  GameMessage_DiscoverMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_DiscoverMsg> createRepeated() => $pb.PbList<GameMessage_DiscoverMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_DiscoverMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_DiscoverMsg>(create);
  static GameMessage_DiscoverMsg? _defaultInstance;
}

class GameMessage_JoinMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.JoinMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..e<PlayerType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerType', $pb.PbFieldType.OE, defaultOrMaker: PlayerType.HUMAN, valueOf: PlayerType.valueOf, enumValues: PlayerType.values)
    ..aQS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playerName')
    ..aQS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameName')
    ..e<NodeRole>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestedRole', $pb.PbFieldType.QE, defaultOrMaker: NodeRole.NORMAL, valueOf: NodeRole.valueOf, enumValues: NodeRole.values)
  ;

  GameMessage_JoinMsg._() : super();
  factory GameMessage_JoinMsg({
    PlayerType? playerType,
    $core.String? playerName,
    $core.String? gameName,
    NodeRole? requestedRole,
  }) {
    final _result = create();
    if (playerType != null) {
      _result.playerType = playerType;
    }
    if (playerName != null) {
      _result.playerName = playerName;
    }
    if (gameName != null) {
      _result.gameName = gameName;
    }
    if (requestedRole != null) {
      _result.requestedRole = requestedRole;
    }
    return _result;
  }
  factory GameMessage_JoinMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_JoinMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_JoinMsg clone() => GameMessage_JoinMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_JoinMsg copyWith(void Function(GameMessage_JoinMsg) updates) => super.copyWith((message) => updates(message as GameMessage_JoinMsg)) as GameMessage_JoinMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_JoinMsg create() => GameMessage_JoinMsg._();
  GameMessage_JoinMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_JoinMsg> createRepeated() => $pb.PbList<GameMessage_JoinMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_JoinMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_JoinMsg>(create);
  static GameMessage_JoinMsg? _defaultInstance;

  @$pb.TagNumber(1)
  PlayerType get playerType => $_getN(0);
  @$pb.TagNumber(1)
  set playerType(PlayerType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerType() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerType() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get playerName => $_getSZ(1);
  @$pb.TagNumber(3)
  set playerName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayerName() => $_has(1);
  @$pb.TagNumber(3)
  void clearPlayerName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gameName => $_getSZ(2);
  @$pb.TagNumber(4)
  set gameName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasGameName() => $_has(2);
  @$pb.TagNumber(4)
  void clearGameName() => clearField(4);

  @$pb.TagNumber(5)
  NodeRole get requestedRole => $_getN(3);
  @$pb.TagNumber(5)
  set requestedRole(NodeRole v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRequestedRole() => $_has(3);
  @$pb.TagNumber(5)
  void clearRequestedRole() => clearField(5);
}

class GameMessage_ErrorMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.ErrorMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMessage')
  ;

  GameMessage_ErrorMsg._() : super();
  factory GameMessage_ErrorMsg({
    $core.String? errorMessage,
  }) {
    final _result = create();
    if (errorMessage != null) {
      _result.errorMessage = errorMessage;
    }
    return _result;
  }
  factory GameMessage_ErrorMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_ErrorMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_ErrorMsg clone() => GameMessage_ErrorMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_ErrorMsg copyWith(void Function(GameMessage_ErrorMsg) updates) => super.copyWith((message) => updates(message as GameMessage_ErrorMsg)) as GameMessage_ErrorMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_ErrorMsg create() => GameMessage_ErrorMsg._();
  GameMessage_ErrorMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_ErrorMsg> createRepeated() => $pb.PbList<GameMessage_ErrorMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_ErrorMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_ErrorMsg>(create);
  static GameMessage_ErrorMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMessage => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMessage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMessage() => clearField(1);
}

class GameMessage_RoleChangeMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage.RoleChangeMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..e<NodeRole>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderRole', $pb.PbFieldType.OE, defaultOrMaker: NodeRole.NORMAL, valueOf: NodeRole.valueOf, enumValues: NodeRole.values)
    ..e<NodeRole>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiverRole', $pb.PbFieldType.OE, defaultOrMaker: NodeRole.NORMAL, valueOf: NodeRole.valueOf, enumValues: NodeRole.values)
    ..hasRequiredFields = false
  ;

  GameMessage_RoleChangeMsg._() : super();
  factory GameMessage_RoleChangeMsg({
    NodeRole? senderRole,
    NodeRole? receiverRole,
  }) {
    final _result = create();
    if (senderRole != null) {
      _result.senderRole = senderRole;
    }
    if (receiverRole != null) {
      _result.receiverRole = receiverRole;
    }
    return _result;
  }
  factory GameMessage_RoleChangeMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage_RoleChangeMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage_RoleChangeMsg clone() => GameMessage_RoleChangeMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage_RoleChangeMsg copyWith(void Function(GameMessage_RoleChangeMsg) updates) => super.copyWith((message) => updates(message as GameMessage_RoleChangeMsg)) as GameMessage_RoleChangeMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage_RoleChangeMsg create() => GameMessage_RoleChangeMsg._();
  GameMessage_RoleChangeMsg createEmptyInstance() => create();
  static $pb.PbList<GameMessage_RoleChangeMsg> createRepeated() => $pb.PbList<GameMessage_RoleChangeMsg>();
  @$core.pragma('dart2js:noInline')
  static GameMessage_RoleChangeMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage_RoleChangeMsg>(create);
  static GameMessage_RoleChangeMsg? _defaultInstance;

  @$pb.TagNumber(1)
  NodeRole get senderRole => $_getN(0);
  @$pb.TagNumber(1)
  set senderRole(NodeRole v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderRole() => clearField(1);

  @$pb.TagNumber(2)
  NodeRole get receiverRole => $_getN(1);
  @$pb.TagNumber(2)
  set receiverRole(NodeRole v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiverRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiverRole() => clearField(2);
}

enum GameMessage_Type {
  ping, 
  steer, 
  ack, 
  state, 
  announcement, 
  join, 
  error, 
  roleChange, 
  discover, 
  notSet
}

class GameMessage extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GameMessage_Type> _GameMessage_TypeByTag = {
    2 : GameMessage_Type.ping,
    3 : GameMessage_Type.steer,
    4 : GameMessage_Type.ack,
    5 : GameMessage_Type.state,
    6 : GameMessage_Type.announcement,
    7 : GameMessage_Type.join,
    8 : GameMessage_Type.error,
    9 : GameMessage_Type.roleChange,
    12 : GameMessage_Type.discover,
    0 : GameMessage_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'snakes'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8, 9, 12])
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msgSeq', $pb.PbFieldType.Q6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<GameMessage_PingMsg>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ping', subBuilder: GameMessage_PingMsg.create)
    ..aOM<GameMessage_SteerMsg>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'steer', subBuilder: GameMessage_SteerMsg.create)
    ..aOM<GameMessage_AckMsg>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ack', subBuilder: GameMessage_AckMsg.create)
    ..aOM<GameMessage_StateMsg>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', subBuilder: GameMessage_StateMsg.create)
    ..aOM<GameMessage_AnnouncementMsg>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'announcement', subBuilder: GameMessage_AnnouncementMsg.create)
    ..aOM<GameMessage_JoinMsg>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'join', subBuilder: GameMessage_JoinMsg.create)
    ..aOM<GameMessage_ErrorMsg>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: GameMessage_ErrorMsg.create)
    ..aOM<GameMessage_RoleChangeMsg>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleChange', subBuilder: GameMessage_RoleChangeMsg.create)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderId', $pb.PbFieldType.O3)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiverId', $pb.PbFieldType.O3)
    ..aOM<GameMessage_DiscoverMsg>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discover', subBuilder: GameMessage_DiscoverMsg.create)
  ;

  GameMessage._() : super();
  factory GameMessage({
    $fixnum.Int64? msgSeq,
    GameMessage_PingMsg? ping,
    GameMessage_SteerMsg? steer,
    GameMessage_AckMsg? ack,
    GameMessage_StateMsg? state,
    GameMessage_AnnouncementMsg? announcement,
    GameMessage_JoinMsg? join,
    GameMessage_ErrorMsg? error,
    GameMessage_RoleChangeMsg? roleChange,
    $core.int? senderId,
    $core.int? receiverId,
    GameMessage_DiscoverMsg? discover,
  }) {
    final _result = create();
    if (msgSeq != null) {
      _result.msgSeq = msgSeq;
    }
    if (ping != null) {
      _result.ping = ping;
    }
    if (steer != null) {
      _result.steer = steer;
    }
    if (ack != null) {
      _result.ack = ack;
    }
    if (state != null) {
      _result.state = state;
    }
    if (announcement != null) {
      _result.announcement = announcement;
    }
    if (join != null) {
      _result.join = join;
    }
    if (error != null) {
      _result.error = error;
    }
    if (roleChange != null) {
      _result.roleChange = roleChange;
    }
    if (senderId != null) {
      _result.senderId = senderId;
    }
    if (receiverId != null) {
      _result.receiverId = receiverId;
    }
    if (discover != null) {
      _result.discover = discover;
    }
    return _result;
  }
  factory GameMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameMessage clone() => GameMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameMessage copyWith(void Function(GameMessage) updates) => super.copyWith((message) => updates(message as GameMessage)) as GameMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameMessage create() => GameMessage._();
  GameMessage createEmptyInstance() => create();
  static $pb.PbList<GameMessage> createRepeated() => $pb.PbList<GameMessage>();
  @$core.pragma('dart2js:noInline')
  static GameMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameMessage>(create);
  static GameMessage? _defaultInstance;

  GameMessage_Type whichType() => _GameMessage_TypeByTag[$_whichOneof(0)]!;
  void clearType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get msgSeq => $_getI64(0);
  @$pb.TagNumber(1)
  set msgSeq($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsgSeq() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgSeq() => clearField(1);

  @$pb.TagNumber(2)
  GameMessage_PingMsg get ping => $_getN(1);
  @$pb.TagNumber(2)
  set ping(GameMessage_PingMsg v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPing() => $_has(1);
  @$pb.TagNumber(2)
  void clearPing() => clearField(2);
  @$pb.TagNumber(2)
  GameMessage_PingMsg ensurePing() => $_ensure(1);

  @$pb.TagNumber(3)
  GameMessage_SteerMsg get steer => $_getN(2);
  @$pb.TagNumber(3)
  set steer(GameMessage_SteerMsg v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSteer() => $_has(2);
  @$pb.TagNumber(3)
  void clearSteer() => clearField(3);
  @$pb.TagNumber(3)
  GameMessage_SteerMsg ensureSteer() => $_ensure(2);

  @$pb.TagNumber(4)
  GameMessage_AckMsg get ack => $_getN(3);
  @$pb.TagNumber(4)
  set ack(GameMessage_AckMsg v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAck() => $_has(3);
  @$pb.TagNumber(4)
  void clearAck() => clearField(4);
  @$pb.TagNumber(4)
  GameMessage_AckMsg ensureAck() => $_ensure(3);

  @$pb.TagNumber(5)
  GameMessage_StateMsg get state => $_getN(4);
  @$pb.TagNumber(5)
  set state(GameMessage_StateMsg v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);
  @$pb.TagNumber(5)
  GameMessage_StateMsg ensureState() => $_ensure(4);

  @$pb.TagNumber(6)
  GameMessage_AnnouncementMsg get announcement => $_getN(5);
  @$pb.TagNumber(6)
  set announcement(GameMessage_AnnouncementMsg v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAnnouncement() => $_has(5);
  @$pb.TagNumber(6)
  void clearAnnouncement() => clearField(6);
  @$pb.TagNumber(6)
  GameMessage_AnnouncementMsg ensureAnnouncement() => $_ensure(5);

  @$pb.TagNumber(7)
  GameMessage_JoinMsg get join => $_getN(6);
  @$pb.TagNumber(7)
  set join(GameMessage_JoinMsg v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasJoin() => $_has(6);
  @$pb.TagNumber(7)
  void clearJoin() => clearField(7);
  @$pb.TagNumber(7)
  GameMessage_JoinMsg ensureJoin() => $_ensure(6);

  @$pb.TagNumber(8)
  GameMessage_ErrorMsg get error => $_getN(7);
  @$pb.TagNumber(8)
  set error(GameMessage_ErrorMsg v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasError() => $_has(7);
  @$pb.TagNumber(8)
  void clearError() => clearField(8);
  @$pb.TagNumber(8)
  GameMessage_ErrorMsg ensureError() => $_ensure(7);

  @$pb.TagNumber(9)
  GameMessage_RoleChangeMsg get roleChange => $_getN(8);
  @$pb.TagNumber(9)
  set roleChange(GameMessage_RoleChangeMsg v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasRoleChange() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoleChange() => clearField(9);
  @$pb.TagNumber(9)
  GameMessage_RoleChangeMsg ensureRoleChange() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get senderId => $_getIZ(9);
  @$pb.TagNumber(10)
  set senderId($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSenderId() => $_has(9);
  @$pb.TagNumber(10)
  void clearSenderId() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get receiverId => $_getIZ(10);
  @$pb.TagNumber(11)
  set receiverId($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasReceiverId() => $_has(10);
  @$pb.TagNumber(11)
  void clearReceiverId() => clearField(11);

  @$pb.TagNumber(12)
  GameMessage_DiscoverMsg get discover => $_getN(11);
  @$pb.TagNumber(12)
  set discover(GameMessage_DiscoverMsg v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasDiscover() => $_has(11);
  @$pb.TagNumber(12)
  void clearDiscover() => clearField(12);
  @$pb.TagNumber(12)
  GameMessage_DiscoverMsg ensureDiscover() => $_ensure(11);
}

