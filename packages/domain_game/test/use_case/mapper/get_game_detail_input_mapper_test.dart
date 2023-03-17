import 'package:domain_game/domain_game.dart';
import 'package:domain_game/src/use_case/mapper/get_game_detail_input_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetGameDetailInputMapper', () {
    final getGameDetailInputMapper = GetGameDetailInputMapper();

    setUp(() {});

    test('when map GetGameDetailInput, should return GetGameDetailRequest', () async {
      // Given
      const input = GetGameDetailInput(
        id: 437049,
      );

      // When
      final result = getGameDetailInputMapper.map(input);

      // Then
      const expected = GetGameDetailRequest(
        id: 437049,
      );
      expect(result, expected);
    });

    tearDown(() {});
  });
}
