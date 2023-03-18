import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_browser/game_browser.dart';

part 'game_detail_event.freezed.dart';

abstract class GameDetailEvent extends BaseBlocEvent {
  const GameDetailEvent();
}

@freezed
class GameDetailGameRefreshedEvent extends GameDetailEvent with _$GameDetailGameRefreshedEvent {
  const factory GameDetailGameRefreshedEvent({
    required int id,
  }) = _GameDetailGameRefreshedEvent;
}

@freezed
class GameDetailInitializedEvent extends GameDetailEvent with _$GameDetailInitializedEvent {
  const factory GameDetailInitializedEvent({
    required int id,
  }) = _GameDetailInitializedEvent;
}
