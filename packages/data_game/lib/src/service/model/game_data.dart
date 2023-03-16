import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_data.freezed.dart';
part 'game_data.g.dart';

@freezed
class GameData with _$GameData {
  const GameData._();

  const factory GameData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'released') String? released,
    @JsonKey(name: 'background_image') String? backgroundImage,
    @JsonKey(name: 'metacritic') int? metacritic,
  }) = _GameData;

  factory GameData.fromJson(Map<String, dynamic> json) => _$GameDataFromJson(json);
}
