import 'package:domain_game/domain_game.dart';

abstract class GameRepository {
  Future<PagedList<Game>> getGames({
    required GetGamesRequest request
  });
}
