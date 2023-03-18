import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_detail_data.freezed.dart';
part 'game_detail_data.g.dart';

@freezed
class GameDetailData with _$GameDetailData {
  const GameDetailData._();

  const factory GameDetailData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'released') String? released,
    @JsonKey(name: 'background_image') String? backgroundImage,
    @JsonKey(name: 'metacritic') int? metacritic,
    @JsonKey(name: 'reviews_count') int? reviewsCount,
    @JsonKey(name: 'description_raw') String? description,
    @JsonKey(name: 'genres') List<GenreData>? genres,
    @JsonKey(name: 'platforms') List<PlatformRequirementData>? platforms,
    @JsonKey(name: 'developers') List<DeveloperData>? developers,
    @JsonKey(name: 'publishers') List<PublisherData>? publishers,
  }) = _GameDetailData;

  factory GameDetailData.fromJson(Map<String, dynamic> json) => _$GameDetailDataFromJson(json);
}

@freezed
class GenreData with _$GenreData {
  const GenreData._();

  const factory GenreData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _GenreData;

  factory GenreData.fromJson(Map<String, dynamic> json) => _$GenreDataFromJson(json);
}

@freezed
class PlatformRequirementData with _$PlatformRequirementData {
  const PlatformRequirementData._();

  const factory PlatformRequirementData({
    @JsonKey(name: 'platform') PlatformData? platform,
  }) = _PlatformRequirementData;

  factory PlatformRequirementData.fromJson(Map<String, dynamic> json) => _$PlatformRequirementDataFromJson(json);
}

@freezed
class PlatformData with _$PlatformData {
  const PlatformData._();

  const factory PlatformData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _PlatformData;

  factory PlatformData.fromJson(Map<String, dynamic> json) => _$PlatformDataFromJson(json);
}

@freezed
class DeveloperData with _$DeveloperData {
  const DeveloperData._();

  const factory DeveloperData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _DeveloperData;

  factory DeveloperData.fromJson(Map<String, dynamic> json) => _$DeveloperDataFromJson(json);
}

@freezed
class PublisherData with _$PublisherData {
  const PublisherData._();

  const factory PublisherData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _PublisherData;

  factory PublisherData.fromJson(Map<String, dynamic> json) => _$PublisherDataFromJson(json);
}
