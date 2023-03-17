import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:data_game/src/repository/game_repository_impl.dart';
import 'package:data_game/src/repository/mapper/paged_list_game_mapper.dart';
import 'package:domain_game/domain_game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameService extends Mock implements GameService {}

void main() {
  group('GameRepositoryImpl', () {
    late GameRepositoryImpl gameRepository;
    final gameService = MockGameService();
    final pagedListGameMapper = PagedListGameMapper();

    setUp(() {
      gameRepository = GameRepositoryImpl(
        gameService,
        pagedListGameMapper,
      );
    });

    test('when getGames is called, should return data', () async {
      // Given
      const request = GetGamesRequest(
        parameter: GetGamesParameter(
          startDate: '2022-03-16',
          endDate: '2023-03-16'
        )
      );
      when(
        () => gameService.getGames(request: request),
      ).thenAnswer(
        (_) => Future.value(
          PagedListData<GameData>(
            count: 1,
            next: null,
            previous: null,
            results: const [
              GameData(
                released: '2023-03-16'
              )
            ],
          )
        ),
      );

      // When
      final result = await gameRepository.getGames(
        request: request
      );

      // Then
      final expected = PagedList<Game>(
        data: [
          Game(
            released: DateTime.parse('2023-03-16')
          )
        ],
        total: 1,
        previousUrl: '',
        nextUrl: '',
      );
      expect(result, expected);
    });

    tearDown(() {});
  });
}
