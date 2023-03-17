import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:data_game/src/service/mapper/game_detail_data_mapper.dart';
import 'package:data_game/src/service/mapper/paged_list_game_data_mapper.dart';
import 'package:domain_game/domain_game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRestApiClient extends Mock implements RawgApiClient {}

void main() {
  group('GameService', () {
    late GameService gameService;
    final restApiClient = MockRestApiClient();
    final pagedListGameDataMapper = PagedListGameDataMapper();
    final gameDetailDataMapper = GameDetailDataMapper();

    setUp(() {
      gameService = GameService(
        restApiClient,
        pagedListGameDataMapper,
        gameDetailDataMapper,
      );
    });

    test('when getGames is called, should return data', () async {
      // Given
      final response = PagedListData<GameData>(
        count: 0,
        next: null,
        previous: null,
        results: [],
      );
      const parameter = GetGamesParameter(
        page: 1,
        startDate: '2022-03-16',
        endDate: '2023-03-16'
      );
      const request = GetGamesRequest(
        parameter: parameter
      );

      // When
      when(
        () => restApiClient.request<PagedListData<GameData>>(
          method: RestMethod.get,
          path: 'games',
          responseMapper: pagedListGameDataMapper,
          queryParameters: {
            'page': parameter.page,
            'page_size': parameter.pageSize,
            'platforms': parameter.platforms,
            'dates': '${parameter.startDate},${parameter.endDate}',
            'ordering': parameter.ordering,
            'key': parameter.key,
          },
        ),
      ).thenAnswer(
        (_) => Future.value(response),
      );
      final result = await gameService.getGames(
        request: request
      );

      // Then
      expect(result, response);
    });
    test('when getGameDetail is called, should return data', () async {
      // Given
      const response = GameDetailData();
      const request = GetGameDetailRequest(
        id: 437049
      );

      // When
      when(
        () => restApiClient.request<GameDetailData>(
          method: RestMethod.get,
          path: 'games/${request.id}',
          responseMapper: gameDetailDataMapper,
        ),
      ).thenAnswer(
        (_) => Future.value(response),
      );
      final result = await gameService.getGameDetail(
        request: request
      );

      // Then
      expect(result, response);
    });

    tearDown(() {});
  });
}
