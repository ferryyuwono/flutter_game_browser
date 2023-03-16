import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:data_game/src/service/mapper/paged_list_game_data_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PagedListGameDataMapper', () {
    final pagedListGameDataMapper = PagedListGameDataMapper();

    setUp(() {});

    test('when map null response, should return empty paged list', () async {
      // Given
      const response = null;

      // When
      final result = pagedListGameDataMapper.map(response);

      // Then
      final expected = PagedListData<GameData>();
      expect(result.count, expected.count);
      expect(result.previous, expected.previous);
      expect(result.next, expected.next);
      expect(result.results, expected.results);
    });
    test('when map invalid response, should return empty paged list', () async {
      // Given
      const response = [];

      // When
      final result = pagedListGameDataMapper.map(response);

      // Then
      final expected = PagedListData<GameData>();
      expect(result.count, expected.count);
      expect(result.previous, expected.previous);
      expect(result.next, expected.next);
      expect(result.results, expected.results);
    });
    test('when map valid response, should return valid paged list', () async {
      // Given
      const response = {
        "count": 239,
        "next": "https://api.rawg.io/api/games?dates=2020-12-21%2C2021-12-21&key=02ef6ba5d13444ee86bad607e8bce3f4&ordering=-released&page=2&page_size=20&platforms=187",
        "previous": null,
        "results": [{
          "slug": "five-nights-at-freddys-security-breach",
          "name": "Five Nights at Freddy's: Security Breach",
          "playtime":9,
          "platforms":[
            {"platform":{"id":4,"name":"PC","slug":"pc"}},
            {"platform":{"id":187,"name":"PlayStation 5","slug":"playstation5"}},
            {"platform":{"id":1,"name":"Xbox One","slug":"xbox-one"}},
            {"platform":{"id":18,"name":"PlayStation 4","slug":"playstation4"}},
            {"platform":{"id":186,"name":"Xbox Series S/X","slug":"xbox-series-x"}}
          ],
          "stores":[
            {"store":{"id":1,"name":"Steam","slug":"steam"}},
            {"store":{"id":3,"name":"PlayStation Store","slug":"playstation-store"}}
          ],
          "released":"2021-12-16",
          "tba":false,
          "background_image": "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
          "rating":2.83,
          "rating_top":1,
          "ratings": [
            {"id":1,"title":"skip","count":14,"percent":35.0},
            {"id":4,"title":"recommended","count":11,"percent":27.5},
            {"id":3,"title":"meh","count":10,"percent":25.0},
            {"id":5,"title":"exceptional","count":5,"percent":12.5}
          ],
          "ratings_count":40,
          "reviews_text_count":0,
          "added":153,
          "added_by_status":{"yet":9,"owned":86,"beaten":26,"toplay":18,"dropped":11,"playing":3},
          "metacritic":64,
          "suggestions_count":245,
          "updated":"2023-03-02T20:39:51",
          "id":494383,
          "score":null,
          "clip":null,
          "tags": [
            {"id":31,"name":"Singleplayer","slug":"singleplayer","language":"eng","games_count":208470,"image_background":"https://media.rawg.io/media/games/8d6/8d69eb6c32ed6acfd75f82d532144993.jpg"},
          ],
          "esrb_rating": {
            "id": 3,
            "name": "Teen",
            "slug": "teen",
            "name_en": "Teen",
            "name_ru": "С 13 лет"
          },
          "user_game": null,
          "reviews_count": 40,
          "saturated_color": "0f0f0f",
          "dominant_color": "0f0f0f",
          "short_screenshots": [
            {
              "id": -1,
              "image": "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg"
            },
            {
              "id": 3157696,
              "image": "https://media.rawg.io/media/screenshots/b0f/b0f861b514a34b00a6053e900a332cce.jpg"
            },
            {
              "id": 3157697,
              "image": "https://media.rawg.io/media/screenshots/7fc/7fc885d61e3c201a494976e3c9c8f5f7.jpg"
            },
            {
              "id": 3157698,
              "image": "https://media.rawg.io/media/screenshots/e62/e6256b1e3d5dfffa027ae946db07d1ff.jpg"
            },
            {
              "id": 3157699,
              "image": "https://media.rawg.io/media/screenshots/bd9/bd9849456ac0a56cf8f1914de031abc4.jpg"
            },
            {
              "id": 3157700,
              "image": "https://media.rawg.io/media/screenshots/4b9/4b9d2db680a57f516d9c8150c5cb338c.jpg"
            },
            {
              "id": 3157701,
              "image": "https://media.rawg.io/media/screenshots/215/215f0806391d2fae9dce2f8b18d4c725.jpg"
            }
          ],
          "parent_platforms": [
            {
              "platform": {
                "id": 2,
                "name": "PlayStation",
                "slug": "playstation"
              }
            },
          ]
        }],
      };

      // When
      final result = pagedListGameDataMapper.map(response);

      // Then
      final expected = PagedListData<GameData>(
        results: const [
          GameData(
            id: 494383,
            name: "Five Nights at Freddy's: Security Breach",
            released: "2021-12-16",
            backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
            metacritic: 64,
          ),
        ],
        next: "https://api.rawg.io/api/games?dates=2020-12-21%2C2021-12-21&key=02ef6ba5d13444ee86bad607e8bce3f4&ordering=-released&page=2&page_size=20&platforms=187",
        previous: null,
        count: 239,
      );
      expect(result.count, expected.count);
      expect(result.previous, expected.previous);
      expect(result.next, expected.next);
      expect(result.results, expected.results);
    });

    tearDown(() {});
  });
}
