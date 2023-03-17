import 'package:domain_game/domain_game.dart';
import 'package:domain_game/src/use_case/mapper/get_games_input_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  group('GetGamesUseCase', () {
    final repository = MockGameRepository();
    final getGamesInputMapper = GetGamesInputMapper();
    final getGamesUseCase = GetGamesUseCase(
      repository,
      getGamesInputMapper
    );

    setUp(() {});

    test('when execute is called, should return correct data', () async {
      // Given
      final gameList = [
        Game(
          released: DateTime.parse('2023-03-16')
        )
      ];
      final response = PagedList<Game>(
        data: gameList,
        total: 1,
        previousUrl: '',
        nextUrl: '',
      );
      const parameter = GetGamesParameter(
        startDate: '2022-03-16',
        endDate: '2023-03-16'
      );
      const request = GetGamesRequest(
        parameter: parameter
      );

      // When
      when(() => repository.getGames(request: request))
          .thenAnswer((_) => Future.value(response));
      final result = await getGamesUseCase.execute(
        GetGamesInput(
          page: 1,
          startDate: DateTime(2022, 3, 16),
          endDate: DateTime(2023, 3, 16)
        )
      );

      // Then
      final expected = GetGamesOutput(
        data: gameList,
        page: 1,
        isSuccess: true,
        isLastPage: true,
        nextUrl: '',
      );
      expect(result, expected);
    });

    tearDown(() {});
  });
}
