import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:data_game/src/repository/game_repository_impl.dart';
import 'package:data_game/src/repository/mapper/game_detail_mapper.dart';
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
    final gameDetailMapper = GameDetailMapper();

    setUp(() {
      gameRepository = GameRepositoryImpl(
        gameService,
        pagedListGameMapper,
        gameDetailMapper,
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
    test('when getGameDetail is called, should return data', () async {
      // Given
      const request = GetGameDetailRequest(
        id: 437049
      );
      when(
        () => gameService.getGameDetail(request: request),
      ).thenAnswer(
        (_) => Future.value(
          const GameDetailData(
            id: 494383,
            name: "Five Nights at Freddy's: Security Breach",
            released: "2021-12-16",
            backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
            metacritic: 64,
            reviewsCount: 5,
            description: "Win as One in EA SPORTS™ FIFA 21, powered by Frostbite™. FIFA 21 has more ways to play than ever before - including the UEFA Champions League and CONMEBOL Libertadores. Stay tuned for exciting news to come.",
            genres: [
              GenreData(
                id: 14,
                name: "Simulation",
              ),
              GenreData(
                id: 15,
                name: "Sports",
              ),
            ],
            platforms: [
              PlatformRequirementData(
                  platform: PlatformData(
                    id: 187,
                    name: "PlayStation 5",
                  )
              ),
              PlatformRequirementData(
                  platform: PlatformData(
                    id: 7,
                    name: "Nintendo Switch",
                  )
              )
            ],
            developers: [
              DeveloperData(
                id: 109,
                name: "Electronic Arts",
              ),
            ],
            publishers: [
              PublisherData(
                id: 354,
                name: "Electronic Arts",
              ),
            ],
          )
        ),
      );

      // When
      final result = await gameRepository.getGameDetail(
          request: request
      );

      // Then
      final expected = GameDetail(
        id: 494383,
        name: "Five Nights at Freddy's: Security Breach",
        released: DateTime.parse("2021-12-16"),
        backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
        metacritic: 64,
        reviewsCount: 5,
        description: "Win as One in EA SPORTS™ FIFA 21, powered by Frostbite™. FIFA 21 has more ways to play than ever before - including the UEFA Champions League and CONMEBOL Libertadores. Stay tuned for exciting news to come.",
        genres: const [
          Genre(
            id: 14,
            name: "Simulation",
          ),
          Genre(
            id: 15,
            name: "Sports",
          ),
        ],
        platforms: const [
          PlatformRequirement(
              platform: Platform(
                id: 187,
                name: "PlayStation 5",
              )
          ),
          PlatformRequirement(
              platform: Platform(
                id: 7,
                name: "Nintendo Switch",
              )
          )
        ],
        developers: const [
          Developer(
            id: 109,
            name: "Electronic Arts",
          ),
        ],
        publishers: const [
          Publisher(
            id: 354,
            name: "Electronic Arts",
          ),
        ],
      );
      expect(result, expected);
    });

    tearDown(() {});
  });
}
