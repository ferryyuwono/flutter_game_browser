import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';

@freezed
class Game with _$Game {
  const factory Game({
    @Default(0) int id,
    @Default('') String name,
    required DateTime released,
    @Default('') String backgroundImage,
    @Default(0) int metacritic,
  }) = _Game;
}

@freezed
class GetGamesRequest with _$GetGamesRequest {
  const factory GetGamesRequest({
    String? url,
    GetGamesParameter? parameter,
  }) = _GetGamesRequest;
}

@freezed
class GetGamesParameter with _$GetGamesParameter {
  const factory GetGamesParameter({
    @Default(1) int page,
    @Default(20) int pageSize,
    @Default(187) int platforms,
    required String startDate,
    required String endDate,
    @Default('-released') String ordering,
    @Default('612dae8efd17443ba8004890223aec1d') String key,
  }) = _GetGamesParameter;
}
