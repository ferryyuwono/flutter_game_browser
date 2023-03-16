import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:data_game/src/service/mapper/paged_list_game_data_mapper.dart';
import 'package:domain_game/domain_game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRestApiClient extends Mock implements RestApiClient {}

void main() {
  group('GameService', () {
    late GameService gameService;
    final restApiClient = MockRestApiClient();
    final pagedListGameDataMapper = PagedListGameDataMapper();

    setUp(() {
      gameService = GameService(
        restApiClient,
        pagedListGameDataMapper,
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
      final parameter = GetGamesParameter(
        startDate: '2022-03-16',
        endDate: '2023-03-16'
      );
      final request = GetGamesRequest(
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

    tearDown(() {});
  });
}
