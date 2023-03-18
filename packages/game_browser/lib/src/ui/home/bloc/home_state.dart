import 'package:domain_game/domain_game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(GetGamesOutput(data: [])) GetGamesOutput games,
    @Default(false) bool isShimmerLoading,
  }) = _HomeState;
}
