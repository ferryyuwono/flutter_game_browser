import 'package:data/data.dart';
import 'package:data_game/src/service/model/game_data.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PagedListGameDataMapper extends ResponseMapper<PagedListData<GameData>> {
  @override
  PagedListData<GameData> map(response) {
    return response != null && response is Map<String, dynamic> ?
      PagedListData.fromJson(response, (json) => GameData.fromJson(json)) :
      PagedListData();
  }
}
