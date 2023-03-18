import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:data_game/src/repository/mapper/paged_list_game_mapper.dart';
import 'package:domain_game/domain_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PagedListGameMapper', () {
    final pagedListGameMapper = PagedListGameMapper();

    setUp(() {});

    test('when map data response, should return model', () async {
      // Given
      final response = PagedListData<GameData>(
        results: const [
          GameData(
            id: 494383,
            name: "Five Nights at Freddy's: Security Breach",
            released: "2021-12-16",
            backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
            metacritic: 64,
          ),
          GameData(
            id: 494384,
            name: "Five Nights at Freddy's: Security Breach",
            released: null,
            backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
            metacritic: 64,
          ),
        ],
        next: "https://api.rawg.io/api/games?dates=2020-12-21%2C2021-12-21&key=02ef6ba5d13444ee86bad607e8bce3f4&ordering=-released&page=2&page_size=20&platforms=187",
        previous: null,
        count: 239,
      );

      // When
      final result = pagedListGameMapper.map(response);

      // Then
      final expected = PagedList<Game>(
        data: [
          Game(
            id: 494383,
            name: "Five Nights at Freddy's: Security Breach",
            released: DateTime.parse("2021-12-16"),
            backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
            metacritic: 64,
          ),
          Game(
            id: 494384,
            name: "Five Nights at Freddy's: Security Breach",
            released: DateTime(0),
            backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
            metacritic: 64,
          ),
        ],
        nextUrl: "https://api.rawg.io/api/games?dates=2020-12-21%2C2021-12-21&key=02ef6ba5d13444ee86bad607e8bce3f4&ordering=-released&page=2&page_size=20&platforms=187",
        previousUrl: '',
        total: 239,
      );
      expect(result, expected);
    });

    tearDown(() {});
  });
}
