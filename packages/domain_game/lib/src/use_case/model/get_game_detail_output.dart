import 'package:domain_game/domain_game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_game_detail_output.freezed.dart';

@freezed
class GetGameDetailOutput with _$GetGameDetailOutput {
  const GetGameDetailOutput._();

  const factory GetGameDetailOutput({
    required GameDetail data,
    @Default(false) bool isSuccess,
  }) = _GetGameDetailOutput;
}
