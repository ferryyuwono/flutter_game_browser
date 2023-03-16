import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:data_game/src/service/mapper/paged_list_game_data_mapper.dart';
import 'package:domain_game/domain_game.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GameService {
  final RestApiClient _apiClient;
  final PagedListGameDataMapper _pagedListGameDataMapper;

  GameService(
    this._apiClient,
    this._pagedListGameDataMapper,
  );

  // https://api.rawg.io/api/games?
  // page=1&page_size=20&platforms=187&dates=2020-12-
  // 21,2021-12-21&ordering=-released&key=02ef6ba5d13444ee86bad607e8bce3f4
  Future<PagedListData<GameData>> getGames({
    required GetGamesRequest request,
  }) async {
    return await _apiClient.request<PagedListData<GameData>>(
      method: RestMethod.get,
      path: request.url ?? 'games',
      responseMapper: _pagedListGameDataMapper,
      queryParameters: request.parameter != null ? {
        'page': request.parameter?.page,
        'page_size': request.parameter?.pageSize,
        'platforms': request.parameter?.platforms,
        'dates': '${request.parameter?.startDate},${request.parameter?.endDate}',
        'ordering': request.parameter?.ordering,
        'key': request.parameter?.key,
      } : null,
    );
  }
}
