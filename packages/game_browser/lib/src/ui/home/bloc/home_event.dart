import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_browser/game_browser.dart';

part 'home_event.freezed.dart';

abstract class HomeEvent extends BaseBlocEvent {
  const HomeEvent();
}

@freezed
class HomePageInitiated extends HomeEvent with _$HomePageInitiated {
  const factory HomePageInitiated() = _HomePageInitiated;
}

@freezed
class HomeGetGames extends HomeEvent with _$HomeGetGames {
  const factory HomeGetGames() = _HomeGetGames;
}
