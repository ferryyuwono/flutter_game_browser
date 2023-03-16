import 'package:domain_game/domain_game.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@Injectable()
class GetGamesInputMapper {
  final dateFormat = DateFormat('yyyy-MM-dd');

  GetGamesInputMapper();

  GetGamesRequest map(GetGamesInput data, String url) {
    if (data is GetGamesInitialized) {
      return GetGamesRequest(
        url: url.isNotEmpty ? url : null,
        parameter: GetGamesParameter(
          startDate: dateFormat.format(data.startDate),
          endDate: dateFormat.format(data.endDate),
        )
      );
    } else if (data is GetGamesLoadMore) {
      return GetGamesRequest(
        url: url.isNotEmpty ? url : null
      );
    }

    return const GetGamesRequest();
  }
}
