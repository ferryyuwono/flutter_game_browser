import 'package:domain_game/domain_game.dart';
import 'package:domain_game/src/use_case/mapper/get_game_detail_input_mapper.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetGameDetailUseCase {
  final GameRepository _repository;
  final GetGameDetailInputMapper _inputMapper;

  GetGameDetailUseCase(
    this._repository,
    this._inputMapper,
  );

  Future<GetGameDetailOutput> execute(GetGameDetailInput input) async {
    GetGameDetailOutput output;
    try {
      final data = await _repository.getGameDetail(
        request: _inputMapper.map(input),
      );

      output = GetGameDetailOutput(
        data: data,
        isSuccess: true,
      );
    } catch (e) {
      output = GetGameDetailOutput(
        data: GameDetail(released: DateTime(0)),
        isSuccess: false,
      );
    }

    return output;
  }
}
