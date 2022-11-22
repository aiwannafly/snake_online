///
//  Generated code. Do not modify.
//  source: snake.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use nodeRoleDescriptor instead')
const NodeRole$json = const {
  '1': 'NodeRole',
  '2': const [
    const {'1': 'NORMAL', '2': 0},
    const {'1': 'MASTER', '2': 1},
    const {'1': 'DEPUTY', '2': 2},
    const {'1': 'VIEWER', '2': 3},
  ],
};

/// Descriptor for `NodeRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List nodeRoleDescriptor = $convert.base64Decode('CghOb2RlUm9sZRIKCgZOT1JNQUwQABIKCgZNQVNURVIQARIKCgZERVBVVFkQAhIKCgZWSUVXRVIQAw==');
@$core.Deprecated('Use playerTypeDescriptor instead')
const PlayerType$json = const {
  '1': 'PlayerType',
  '2': const [
    const {'1': 'HUMAN', '2': 0},
    const {'1': 'ROBOT', '2': 1},
  ],
};

/// Descriptor for `PlayerType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List playerTypeDescriptor = $convert.base64Decode('CgpQbGF5ZXJUeXBlEgkKBUhVTUFOEAASCQoFUk9CT1QQAQ==');
@$core.Deprecated('Use directionDescriptor instead')
const Direction$json = const {
  '1': 'Direction',
  '2': const [
    const {'1': 'UP', '2': 1},
    const {'1': 'DOWN', '2': 2},
    const {'1': 'LEFT', '2': 3},
    const {'1': 'RIGHT', '2': 4},
  ],
};

/// Descriptor for `Direction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List directionDescriptor = $convert.base64Decode('CglEaXJlY3Rpb24SBgoCVVAQARIICgRET1dOEAISCAoETEVGVBADEgkKBVJJR0hUEAQ=');
@$core.Deprecated('Use gamePlayerDescriptor instead')
const GamePlayer$json = const {
  '1': 'GamePlayer',
  '2': const [
    const {'1': 'name', '3': 1, '4': 2, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 2, '5': 5, '10': 'id'},
    const {'1': 'ip_address', '3': 3, '4': 1, '5': 9, '10': 'ipAddress'},
    const {'1': 'port', '3': 4, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'role', '3': 5, '4': 2, '5': 14, '6': '.snakes.NodeRole', '10': 'role'},
    const {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.snakes.PlayerType', '7': 'HUMAN', '10': 'type'},
    const {'1': 'score', '3': 7, '4': 2, '5': 5, '10': 'score'},
  ],
};

/// Descriptor for `GamePlayer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gamePlayerDescriptor = $convert.base64Decode('CgpHYW1lUGxheWVyEhIKBG5hbWUYASACKAlSBG5hbWUSDgoCaWQYAiACKAVSAmlkEh0KCmlwX2FkZHJlc3MYAyABKAlSCWlwQWRkcmVzcxISCgRwb3J0GAQgASgFUgRwb3J0EiQKBHJvbGUYBSACKA4yEC5zbmFrZXMuTm9kZVJvbGVSBHJvbGUSLQoEdHlwZRgGIAEoDjISLnNuYWtlcy5QbGF5ZXJUeXBlOgVIVU1BTlIEdHlwZRIUCgVzY29yZRgHIAIoBVIFc2NvcmU=');
@$core.Deprecated('Use gameConfigDescriptor instead')
const GameConfig$json = const {
  '1': 'GameConfig',
  '2': const [
    const {'1': 'width', '3': 1, '4': 1, '5': 5, '7': '40', '10': 'width'},
    const {'1': 'height', '3': 2, '4': 1, '5': 5, '7': '30', '10': 'height'},
    const {'1': 'food_static', '3': 3, '4': 1, '5': 5, '7': '1', '10': 'foodStatic'},
    const {'1': 'state_delay_ms', '3': 5, '4': 1, '5': 5, '7': '1000', '10': 'stateDelayMs'},
  ],
};

/// Descriptor for `GameConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameConfigDescriptor = $convert.base64Decode('CgpHYW1lQ29uZmlnEhgKBXdpZHRoGAEgASgFOgI0MFIFd2lkdGgSGgoGaGVpZ2h0GAIgASgFOgIzMFIGaGVpZ2h0EiIKC2Zvb2Rfc3RhdGljGAMgASgFOgExUgpmb29kU3RhdGljEioKDnN0YXRlX2RlbGF5X21zGAUgASgFOgQxMDAwUgxzdGF0ZURlbGF5TXM=');
@$core.Deprecated('Use gamePlayersDescriptor instead')
const GamePlayers$json = const {
  '1': 'GamePlayers',
  '2': const [
    const {'1': 'players', '3': 1, '4': 3, '5': 11, '6': '.snakes.GamePlayer', '10': 'players'},
  ],
};

/// Descriptor for `GamePlayers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gamePlayersDescriptor = $convert.base64Decode('CgtHYW1lUGxheWVycxIsCgdwbGF5ZXJzGAEgAygLMhIuc25ha2VzLkdhbWVQbGF5ZXJSB3BsYXllcnM=');
@$core.Deprecated('Use gameStateDescriptor instead')
const GameState$json = const {
  '1': 'GameState',
  '2': const [
    const {'1': 'state_order', '3': 1, '4': 2, '5': 5, '10': 'stateOrder'},
    const {'1': 'snakes', '3': 2, '4': 3, '5': 11, '6': '.snakes.GameState.Snake', '10': 'snakes'},
    const {'1': 'foods', '3': 3, '4': 3, '5': 11, '6': '.snakes.GameState.Coord', '10': 'foods'},
    const {'1': 'players', '3': 4, '4': 2, '5': 11, '6': '.snakes.GamePlayers', '10': 'players'},
  ],
  '3': const [GameState_Coord$json, GameState_Snake$json],
};

@$core.Deprecated('Use gameStateDescriptor instead')
const GameState_Coord$json = const {
  '1': 'Coord',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 17, '7': '0', '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 17, '7': '0', '10': 'y'},
  ],
};

@$core.Deprecated('Use gameStateDescriptor instead')
const GameState_Snake$json = const {
  '1': 'Snake',
  '2': const [
    const {'1': 'player_id', '3': 1, '4': 2, '5': 5, '10': 'playerId'},
    const {'1': 'points', '3': 2, '4': 3, '5': 11, '6': '.snakes.GameState.Coord', '10': 'points'},
    const {'1': 'state', '3': 3, '4': 2, '5': 14, '6': '.snakes.GameState.Snake.SnakeState', '7': 'ALIVE', '10': 'state'},
    const {'1': 'head_direction', '3': 4, '4': 2, '5': 14, '6': '.snakes.Direction', '10': 'headDirection'},
  ],
  '4': const [GameState_Snake_SnakeState$json],
};

@$core.Deprecated('Use gameStateDescriptor instead')
const GameState_Snake_SnakeState$json = const {
  '1': 'SnakeState',
  '2': const [
    const {'1': 'ALIVE', '2': 0},
    const {'1': 'ZOMBIE', '2': 1},
  ],
};

/// Descriptor for `GameState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameStateDescriptor = $convert.base64Decode('CglHYW1lU3RhdGUSHwoLc3RhdGVfb3JkZXIYASACKAVSCnN0YXRlT3JkZXISLwoGc25ha2VzGAIgAygLMhcuc25ha2VzLkdhbWVTdGF0ZS5TbmFrZVIGc25ha2VzEi0KBWZvb2RzGAMgAygLMhcuc25ha2VzLkdhbWVTdGF0ZS5Db29yZFIFZm9vZHMSLQoHcGxheWVycxgEIAIoCzITLnNuYWtlcy5HYW1lUGxheWVyc1IHcGxheWVycxopCgVDb29yZBIPCgF4GAEgASgROgEwUgF4Eg8KAXkYAiABKBE6ATBSAXka9QEKBVNuYWtlEhsKCXBsYXllcl9pZBgBIAIoBVIIcGxheWVySWQSLwoGcG9pbnRzGAIgAygLMhcuc25ha2VzLkdhbWVTdGF0ZS5Db29yZFIGcG9pbnRzEj8KBXN0YXRlGAMgAigOMiIuc25ha2VzLkdhbWVTdGF0ZS5TbmFrZS5TbmFrZVN0YXRlOgVBTElWRVIFc3RhdGUSOAoOaGVhZF9kaXJlY3Rpb24YBCACKA4yES5zbmFrZXMuRGlyZWN0aW9uUg1oZWFkRGlyZWN0aW9uIiMKClNuYWtlU3RhdGUSCQoFQUxJVkUQABIKCgZaT01CSUUQAQ==');
@$core.Deprecated('Use gameAnnouncementDescriptor instead')
const GameAnnouncement$json = const {
  '1': 'GameAnnouncement',
  '2': const [
    const {'1': 'players', '3': 1, '4': 2, '5': 11, '6': '.snakes.GamePlayers', '10': 'players'},
    const {'1': 'config', '3': 2, '4': 2, '5': 11, '6': '.snakes.GameConfig', '10': 'config'},
    const {'1': 'can_join', '3': 3, '4': 1, '5': 8, '7': 'true', '10': 'canJoin'},
    const {'1': 'game_name', '3': 4, '4': 2, '5': 9, '10': 'gameName'},
  ],
};

/// Descriptor for `GameAnnouncement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameAnnouncementDescriptor = $convert.base64Decode('ChBHYW1lQW5ub3VuY2VtZW50Ei0KB3BsYXllcnMYASACKAsyEy5zbmFrZXMuR2FtZVBsYXllcnNSB3BsYXllcnMSKgoGY29uZmlnGAIgAigLMhIuc25ha2VzLkdhbWVDb25maWdSBmNvbmZpZxIfCghjYW5fam9pbhgDIAEoCDoEdHJ1ZVIHY2FuSm9pbhIbCglnYW1lX25hbWUYBCACKAlSCGdhbWVOYW1l');
@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage$json = const {
  '1': 'GameMessage',
  '2': const [
    const {'1': 'msg_seq', '3': 1, '4': 2, '5': 3, '10': 'msgSeq'},
    const {'1': 'sender_id', '3': 10, '4': 1, '5': 5, '10': 'senderId'},
    const {'1': 'receiver_id', '3': 11, '4': 1, '5': 5, '10': 'receiverId'},
    const {'1': 'ping', '3': 2, '4': 1, '5': 11, '6': '.snakes.GameMessage.PingMsg', '9': 0, '10': 'ping'},
    const {'1': 'steer', '3': 3, '4': 1, '5': 11, '6': '.snakes.GameMessage.SteerMsg', '9': 0, '10': 'steer'},
    const {'1': 'ack', '3': 4, '4': 1, '5': 11, '6': '.snakes.GameMessage.AckMsg', '9': 0, '10': 'ack'},
    const {'1': 'state', '3': 5, '4': 1, '5': 11, '6': '.snakes.GameMessage.StateMsg', '9': 0, '10': 'state'},
    const {'1': 'announcement', '3': 6, '4': 1, '5': 11, '6': '.snakes.GameMessage.AnnouncementMsg', '9': 0, '10': 'announcement'},
    const {'1': 'join', '3': 7, '4': 1, '5': 11, '6': '.snakes.GameMessage.JoinMsg', '9': 0, '10': 'join'},
    const {'1': 'error', '3': 8, '4': 1, '5': 11, '6': '.snakes.GameMessage.ErrorMsg', '9': 0, '10': 'error'},
    const {'1': 'role_change', '3': 9, '4': 1, '5': 11, '6': '.snakes.GameMessage.RoleChangeMsg', '9': 0, '10': 'roleChange'},
    const {'1': 'discover', '3': 12, '4': 1, '5': 11, '6': '.snakes.GameMessage.DiscoverMsg', '9': 0, '10': 'discover'},
  ],
  '3': const [GameMessage_PingMsg$json, GameMessage_SteerMsg$json, GameMessage_AckMsg$json, GameMessage_StateMsg$json, GameMessage_AnnouncementMsg$json, GameMessage_DiscoverMsg$json, GameMessage_JoinMsg$json, GameMessage_ErrorMsg$json, GameMessage_RoleChangeMsg$json],
  '8': const [
    const {'1': 'Type'},
  ],
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_PingMsg$json = const {
  '1': 'PingMsg',
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_SteerMsg$json = const {
  '1': 'SteerMsg',
  '2': const [
    const {'1': 'direction', '3': 1, '4': 2, '5': 14, '6': '.snakes.Direction', '10': 'direction'},
  ],
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_AckMsg$json = const {
  '1': 'AckMsg',
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_StateMsg$json = const {
  '1': 'StateMsg',
  '2': const [
    const {'1': 'state', '3': 1, '4': 2, '5': 11, '6': '.snakes.GameState', '10': 'state'},
  ],
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_AnnouncementMsg$json = const {
  '1': 'AnnouncementMsg',
  '2': const [
    const {'1': 'games', '3': 1, '4': 3, '5': 11, '6': '.snakes.GameAnnouncement', '10': 'games'},
  ],
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_DiscoverMsg$json = const {
  '1': 'DiscoverMsg',
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_JoinMsg$json = const {
  '1': 'JoinMsg',
  '2': const [
    const {'1': 'player_type', '3': 1, '4': 1, '5': 14, '6': '.snakes.PlayerType', '7': 'HUMAN', '10': 'playerType'},
    const {'1': 'player_name', '3': 3, '4': 2, '5': 9, '10': 'playerName'},
    const {'1': 'game_name', '3': 4, '4': 2, '5': 9, '10': 'gameName'},
    const {'1': 'requested_role', '3': 5, '4': 2, '5': 14, '6': '.snakes.NodeRole', '10': 'requestedRole'},
  ],
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_ErrorMsg$json = const {
  '1': 'ErrorMsg',
  '2': const [
    const {'1': 'error_message', '3': 1, '4': 2, '5': 9, '10': 'errorMessage'},
  ],
};

@$core.Deprecated('Use gameMessageDescriptor instead')
const GameMessage_RoleChangeMsg$json = const {
  '1': 'RoleChangeMsg',
  '2': const [
    const {'1': 'sender_role', '3': 1, '4': 1, '5': 14, '6': '.snakes.NodeRole', '10': 'senderRole'},
    const {'1': 'receiver_role', '3': 2, '4': 1, '5': 14, '6': '.snakes.NodeRole', '10': 'receiverRole'},
  ],
};

/// Descriptor for `GameMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameMessageDescriptor = $convert.base64Decode('CgtHYW1lTWVzc2FnZRIXCgdtc2dfc2VxGAEgAigDUgZtc2dTZXESGwoJc2VuZGVyX2lkGAogASgFUghzZW5kZXJJZBIfCgtyZWNlaXZlcl9pZBgLIAEoBVIKcmVjZWl2ZXJJZBIxCgRwaW5nGAIgASgLMhsuc25ha2VzLkdhbWVNZXNzYWdlLlBpbmdNc2dIAFIEcGluZxI0CgVzdGVlchgDIAEoCzIcLnNuYWtlcy5HYW1lTWVzc2FnZS5TdGVlck1zZ0gAUgVzdGVlchIuCgNhY2sYBCABKAsyGi5zbmFrZXMuR2FtZU1lc3NhZ2UuQWNrTXNnSABSA2FjaxI0CgVzdGF0ZRgFIAEoCzIcLnNuYWtlcy5HYW1lTWVzc2FnZS5TdGF0ZU1zZ0gAUgVzdGF0ZRJJCgxhbm5vdW5jZW1lbnQYBiABKAsyIy5zbmFrZXMuR2FtZU1lc3NhZ2UuQW5ub3VuY2VtZW50TXNnSABSDGFubm91bmNlbWVudBIxCgRqb2luGAcgASgLMhsuc25ha2VzLkdhbWVNZXNzYWdlLkpvaW5Nc2dIAFIEam9pbhI0CgVlcnJvchgIIAEoCzIcLnNuYWtlcy5HYW1lTWVzc2FnZS5FcnJvck1zZ0gAUgVlcnJvchJECgtyb2xlX2NoYW5nZRgJIAEoCzIhLnNuYWtlcy5HYW1lTWVzc2FnZS5Sb2xlQ2hhbmdlTXNnSABSCnJvbGVDaGFuZ2USPQoIZGlzY292ZXIYDCABKAsyHy5zbmFrZXMuR2FtZU1lc3NhZ2UuRGlzY292ZXJNc2dIAFIIZGlzY292ZXIaCQoHUGluZ01zZxo7CghTdGVlck1zZxIvCglkaXJlY3Rpb24YASACKA4yES5zbmFrZXMuRGlyZWN0aW9uUglkaXJlY3Rpb24aCAoGQWNrTXNnGjMKCFN0YXRlTXNnEicKBXN0YXRlGAEgAigLMhEuc25ha2VzLkdhbWVTdGF0ZVIFc3RhdGUaQQoPQW5ub3VuY2VtZW50TXNnEi4KBWdhbWVzGAEgAygLMhguc25ha2VzLkdhbWVBbm5vdW5jZW1lbnRSBWdhbWVzGg0KC0Rpc2NvdmVyTXNnGrwBCgdKb2luTXNnEjoKC3BsYXllcl90eXBlGAEgASgOMhIuc25ha2VzLlBsYXllclR5cGU6BUhVTUFOUgpwbGF5ZXJUeXBlEh8KC3BsYXllcl9uYW1lGAMgAigJUgpwbGF5ZXJOYW1lEhsKCWdhbWVfbmFtZRgEIAIoCVIIZ2FtZU5hbWUSNwoOcmVxdWVzdGVkX3JvbGUYBSACKA4yEC5zbmFrZXMuTm9kZVJvbGVSDXJlcXVlc3RlZFJvbGUaLwoIRXJyb3JNc2cSIwoNZXJyb3JfbWVzc2FnZRgBIAIoCVIMZXJyb3JNZXNzYWdlGnkKDVJvbGVDaGFuZ2VNc2cSMQoLc2VuZGVyX3JvbGUYASABKA4yEC5zbmFrZXMuTm9kZVJvbGVSCnNlbmRlclJvbGUSNQoNcmVjZWl2ZXJfcm9sZRgCIAEoDjIQLnNuYWtlcy5Ob2RlUm9sZVIMcmVjZWl2ZXJSb2xlQgYKBFR5cGU=');
