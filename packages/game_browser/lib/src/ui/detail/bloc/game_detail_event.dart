import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_detail_event.freezed.dart';

abstract class GameDetailEvent {}

@freezed
class GameDetailInitializedEvent extends GameDetailEvent with _$GameDetailInitializedEvent {
  const factory GameDetailInitializedEvent({
    required int id,
  }) = _GameDetailInitializedEvent;
}
