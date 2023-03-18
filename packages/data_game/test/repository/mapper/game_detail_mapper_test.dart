import 'package:data_game/data_game.dart';
import 'package:data_game/src/repository/mapper/game_detail_mapper.dart';
import 'package:domain_game/domain_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GameDetailMapper', () {
    final gameDetailMapper = GameDetailMapper();

    setUp(() {});

    test('when map data response, should return model', () async {
      // Given
      const response = GameDetailData(
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
      );

      // When
      final result = gameDetailMapper.map(response);

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
