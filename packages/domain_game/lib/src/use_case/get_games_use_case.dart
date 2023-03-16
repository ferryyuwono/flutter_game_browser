import 'package:domain_game/domain_game.dart';
import 'package:domain_game/src/use_case/mapper/get_games_input_mapper.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetGamesUseCase {
  final GameRepository _repository;
  final GetGamesInputMapper _inputMapper;

  GetGamesOutput _result = const GetGamesOutput(
    data: [],
    isSuccess: true,
    isLastPage: false,
    nextUrl: '',
  );

  GetGamesUseCase(
    this._repository,
    this._inputMapper,
  );

  Future<GetGamesOutput> execute(GetGamesInput input) async {
    GetGamesOutput output;
    try {
      final pagedList = await _repository.getGames(
        request: _inputMapper.map(input, _result.nextUrl),
      );

      output = _result.copyWith(
        data: [..._result.data, ...pagedList.data],
        isSuccess: true,
        isLastPage: pagedList.nextUrl.isEmpty,
        nextUrl: pagedList.nextUrl
      );
      _result = output;
    } catch (e) {
      output = _result.copyWith(
        isSuccess: false,
      );
      _result = output;
    }

    return output;
  }
}
