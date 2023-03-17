import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GameDetailDataMapper extends ResponseMapper<GameDetailData> {
  @override
  GameDetailData map(response) {
    return response != null && response is Map<String, dynamic> ?
      GameDetailData.fromJson(response) :
      const GameDetailData();
  }
}
