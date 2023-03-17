import 'package:domain_game/domain_game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_games_output.freezed.dart';

@freezed
class GetGamesOutput with _$GetGamesOutput {
  const GetGamesOutput._();

  const factory GetGamesOutput({
    required List<Game> data,
    @Default(0) int page,
    @Default(false) bool isSuccess,
    @Default(false) bool isLastPage,
    @Default('') String nextUrl,
  }) = _GetGamesOutput;
}
