import 'package:domain_game/domain_game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_browser/game_browser.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState extends BaseBlocState with _$HomeState {
  factory HomeState({
    @Default(GetGamesOutput(data: [])) GetGamesOutput games,
    @Default(false) bool isShimmerLoading,
  }) = _HomeState;
}
