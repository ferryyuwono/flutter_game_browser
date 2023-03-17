import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:data_game/src/service/mapper/game_detail_data_mapper.dart';
import 'package:data_game/src/service/mapper/paged_list_game_data_mapper.dart';
import 'package:domain_game/domain_game.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GameService {
  final RawgApiClient _apiClient;
  final PagedListGameDataMapper _pagedListGameDataMapper;
  final GameDetailDataMapper _gameDetailDataMapper;

  GameService(
    this._apiClient,
    this._pagedListGameDataMapper,
    this._gameDetailDataMapper,
  );

  Future<PagedListData<GameData>> getGames({
    required GetGamesRequest request,
  }) async {
    return await _apiClient.request<PagedListData<GameData>>(
      method: RestMethod.get,
      path: 'games',
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

  Future<GameDetailData> getGameDetail({
    required GetGameDetailRequest request,
  }) async {
    return await _apiClient.request<GameDetailData>(
      method: RestMethod.get,
      path: 'games/${request.id}',
      responseMapper: _gameDetailDataMapper,
    );
  }
}
