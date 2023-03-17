import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_game_detail_input.freezed.dart';

@freezed
class GetGameDetailInput with _$GetGameDetailInput {
  const factory GetGameDetailInput({
    required int id,
  }) = _GetGameDetailInput;
}
