import 'package:domain_game/domain_game.dart';
import 'package:domain_game/src/use_case/mapper/get_games_input_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetGamesInputMapper', () {
    final getGamesInputMapper = GetGamesInputMapper();

    setUp(() {});

    test('when map GetGamesInput, should return GetGamesRequest with parameter', () async {
      // Given
      final endDate = DateTime(2023, 3, 16);
      final startDate = DateTime(2022, 3, 16);
      final input = GetGamesInput(
        page: 1,
        startDate: startDate,
        endDate: endDate,
      );

      // When
      final result = getGamesInputMapper.map(input);

      // Then
      const expected = GetGamesRequest(
        parameter: GetGamesParameter(
          startDate: '2022-03-16',
          endDate: '2023-03-16',
        )
      );
      expect(result, expected);
    });

    tearDown(() {});
  });
}
