import 'package:domain_game/domain_game.dart';
import 'package:domain_game/src/use_case/mapper/get_games_input_mapper.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetGamesUseCase {
  final GameRepository _repository;
  final GetGamesInputMapper _inputMapper;

  GetGamesUseCase(
    this._repository,
    this._inputMapper,
  );

  Future<GetGamesOutput> execute(GetGamesInput input) async {
    GetGamesOutput output;
    try {
      final pagedList = await _repository.getGames(
        request: _inputMapper.map(input),
      );

      output = GetGamesOutput(
        data: pagedList.data,
        page: input.page,
        isSuccess: true,
        isLastPage: pagedList.nextUrl.isEmpty,
      );
    } catch (e) {
      output = GetGamesOutput(
        data: [],
        page: input.page,
        isSuccess: false,
      );
    }

    return output;
  }
}
