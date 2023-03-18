import 'package:domain_game/domain_game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_detail_state.freezed.dart';

@freezed
class GameDetailState with _$GameDetailState {
  factory GameDetailState({
    required GetGameDetailOutput gameDetail,
    @Default(false) bool isShimmerLoading,
  }) = _GameDetailState;
}
