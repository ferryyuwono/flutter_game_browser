import 'package:data_game/data_game.dart';
import 'package:data_game/src/repository/mapper/game_detail_mapper.dart';
import 'package:data_game/src/repository/mapper/paged_list_game_mapper.dart';
import 'package:domain_game/domain_game.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GameRepository)
class GameRepositoryImpl implements GameRepository {
  final GameService _gameService;
  final PagedListGameMapper _pagedListGameMapper;
  final GameDetailMapper _gameDetailMapper;

  GameRepositoryImpl(
    this._gameService,
    this._pagedListGameMapper,
    this._gameDetailMapper,
  );

  @override
  Future<PagedList<Game>> getGames({
    required GetGamesRequest request,
  }) async {
    final response = await _gameService.getGames(request: request);
    return _pagedListGameMapper.map(response);
  }

  @override
  Future<GameDetail> getGameDetail({
    required GetGameDetailRequest request,
  }) async {
    final response = await _gameService.getGameDetail(request: request);
    return _gameDetailMapper.map(response);
  }
}
