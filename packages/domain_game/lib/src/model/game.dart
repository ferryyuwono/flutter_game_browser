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

class GetGamesRequest {
  final String? url;
  final GetGamesParameter? parameter;

  GetGamesRequest({
    this.url,
    this.parameter,
  });
}

class GetGamesParameter {
  final int page;
  final int pageSize;
  final int platforms;
  final String startDate;
  final String endDate;
  final String ordering;
  final String key;

  GetGamesParameter({
    this.page = 1,
    this.pageSize = 20,
    this.platforms = 187,
    required this.startDate,
    required this.endDate,
    this.ordering = "-released",
    this.key = "612dae8efd17443ba8004890223aec1d",
  });
}
