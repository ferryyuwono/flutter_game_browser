import 'package:domain_game/domain_game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_browser/game_browser.dart';

part 'game_detail_state.freezed.dart';

@freezed
class GameDetailState extends BaseBlocState with _$GameDetailState {
  factory GameDetailState({
    required GetGameDetailOutput gameDetail,
    @Default(false) bool isShimmerLoading,
  }) = _GameDetailState;
}
