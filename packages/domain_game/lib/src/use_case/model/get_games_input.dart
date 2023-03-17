import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_games_input.freezed.dart';

@freezed
class GetGamesInput with _$GetGamesInput {
  const factory GetGamesInput({
    required int page,
    required DateTime startDate,
    required DateTime endDate,
  }) = _GetGamesInput;
}
