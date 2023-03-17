import 'package:domain_game/domain_game.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetGameDetailInputMapper {
  GetGameDetailInputMapper();

  GetGameDetailRequest map(GetGameDetailInput data) {
    return GetGameDetailRequest(
      id: data.id,
    );
  }
}
