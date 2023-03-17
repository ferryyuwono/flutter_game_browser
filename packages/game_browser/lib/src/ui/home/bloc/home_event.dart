import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_browser/game_browser.dart';

part 'home_event.freezed.dart';

abstract class HomeEvent extends BaseBlocEvent {
  const HomeEvent();
}

@freezed
class HomeGameRefreshedEvent extends HomeEvent with _$HomeGameRefreshedEvent {
  const factory HomeGameRefreshedEvent() = _HomeGameRefreshedEvent;
}

@freezed
class HomeGetGameEvent extends HomeEvent with _$HomeGetGameEvent {
  const factory HomeGetGameEvent({
    required int page,
    required DateTime startDate,
    required DateTime endDate,
  }) = _HomeGetGameEvent;
}
