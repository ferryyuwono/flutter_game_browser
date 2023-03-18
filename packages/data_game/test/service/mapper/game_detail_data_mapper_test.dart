import 'package:data_game/data_game.dart';
import 'package:data_game/src/service/mapper/game_detail_data_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GameDetailDataMapper', () {
    final gameDetailDataMapper = GameDetailDataMapper();

    setUp(() {});

    test('when map null response, should return empty game detail', () async {
      // Given
      const response = null;

      // When
      final result = gameDetailDataMapper.map(response);

      // Then
      const expected = GameDetailData();
      expect(result, expected);
    });
    test('when map invalid response, should return empty paged list', () async {
      // Given
      const response = [];

      // When
      final result = gameDetailDataMapper.map(response);

      // Then
      const expected = GameDetailData();
      expect(result, expected);
    });
    test('when map valid response, should return valid paged list', () async {
      // Given
      const response = {
        "slug": "five-nights-at-freddys-security-breach",
        "name": "Five Nights at Freddy's: Security Breach",
        "playtime":9,
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
        "genres": [
          {
            "id": 14,
            "name": "Simulation",
            "slug": "simulation",
            "games_count": 66969,
            "image_background": "https://media.rawg.io/media/games/a91/a911f0a91991469e398fa70091507a5b.jpg"
          },
          {
            "id": 15,
            "name": "Sports",
            "slug": "sports",
            "games_count": 20767,
            "image_background": "https://media.rawg.io/media/games/d16/d160819f22de73d29813f7b6dad815f9.jpg"
          }
        ],
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
        "platforms": [
          {
            "platform": {
              "id": 187,
              "name": "PlayStation 5",
              "slug": "playstation5",
              "image": null,
              "year_end": null,
              "year_start": 2020,
              "games_count": 824,
              "image_background": "https://media.rawg.io/media/games/253/2534a46f3da7fa7c315f1387515ca393.jpg"
            },
            "released_at": "2020-10-06",
            "requirements": {}
          },
          {
            "platform": {
              "id": 7,
              "name": "Nintendo Switch",
              "slug": "nintendo-switch",
              "image": null,
              "year_end": null,
              "year_start": null,
              "games_count": 5199,
              "image_background": "https://media.rawg.io/media/games/b72/b7233d5d5b1e75e86bb860ccc7aeca85.jpg"
            },
            "released_at": "2020-10-06",
            "requirements": {}
          },
        ],
        "developers": [
          {
            "id": 109,
            "name": "Electronic Arts",
            "slug": "electronic-arts",
            "games_count": 324,
            "image_background": "https://media.rawg.io/media/games/369/36914d895c20e35f273286145c267764.jpg"
          }
        ],
        "publishers": [
          {
            "id": 354,
            "name": "Electronic Arts",
            "slug": "electronic-arts",
            "games_count": 1303,
            "image_background": "https://media.rawg.io/media/games/476/476178ef18ab0534771d099f51cdc694.jpg"
          }
        ],
        "description_raw": "Win as One in EA SPORTS™ FIFA 21, powered by Frostbite™. FIFA 21 has more ways to play than ever before - including the UEFA Champions League and CONMEBOL Libertadores. Stay tuned for exciting news to come.",
      };

      // When
      final result = gameDetailDataMapper.map(response);

      // Then
      const expected = GameDetailData(
        id: 494383,
        name: "Five Nights at Freddy's: Security Breach",
        released: "2021-12-16",
        backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
        metacritic: 64,
        reviewsCount: 40,
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
      expect(result, expected);
    });

    tearDown(() {});
  });
}
