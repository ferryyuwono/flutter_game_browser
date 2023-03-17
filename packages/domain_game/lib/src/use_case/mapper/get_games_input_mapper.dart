import 'package:domain_game/domain_game.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@Injectable()
class GetGamesInputMapper {
  final dateFormat = DateFormat('yyyy-MM-dd');

  GetGamesInputMapper();

  GetGamesRequest map(GetGamesInput data) {
    return GetGamesRequest(
      parameter: GetGamesParameter(
        page: data.page,
        startDate: dateFormat.format(data.startDate),
        endDate: dateFormat.format(data.endDate),
      )
    );
  }
}
