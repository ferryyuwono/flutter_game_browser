import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_detail.freezed.dart';

@freezed
class GameDetail with _$GameDetail {
  const factory GameDetail({
    @Default(0) int id,
    @Default('') String name,
    required DateTime released,
    @Default('') String backgroundImage,
    @Default(0) int metacritic,
    @Default('') String description,
    @Default([]) List<Genre> genres,
    @Default([]) List<PlatformRequirement> platforms,
    @Default([]) List<Developer> developers,
    @Default([]) List<Publisher> publishers,
  }) = _GameDetail;
}

@freezed
class GetGameDetailRequest with _$GetGameDetailRequest {
  const factory GetGameDetailRequest({
    required int id,
  }) = _GetGameDetailRequest;
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    @Default(0) int id,
    @Default('') String name,
  }) = _Genre;
}

@freezed
class PlatformRequirement with _$PlatformRequirement {
  const factory PlatformRequirement({
    @Default(Platform()) Platform platform,
  }) = _PlatformRequirement;
}

@freezed
class Platform with _$Platform {
  const factory Platform({
    @Default(0) int id,
    @Default('') String name,
  }) = _Platform;
}

@freezed
class Developer with _$Developer {
  const factory Developer({
    @Default(0) int id,
    @Default('') String name,
  }) = _Developer;
}

@freezed
class Publisher with _$Publisher {
  const factory Publisher({
    @Default(0) int id,
    @Default('') String name,
  }) = _Publisher;
}
