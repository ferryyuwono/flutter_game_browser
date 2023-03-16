import 'package:data/data.dart';
import 'package:data_game/data_game.dart';
import 'package:domain_game/domain_game.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PagedListGameMapper {
  PagedListGameMapper();

  PagedList<Game> map(PagedListData<GameData> data) {
    return PagedList<Game>(
      data: data.results?.map((e) =>
        Game(
          id: e.id ?? 0,
          name: e.name ?? '',
          backgroundImage: e.backgroundImage ?? '',
          released: e.released != null ?
            DateTime.parse(e.released ?? '') :
            DateTime(0),
          metacritic: e.metacritic ?? 0,
        )
      ).toList() ?? [],
      nextUrl: data.next ?? '',
      previousUrl: data.previous ?? '',
      total: data.count ?? 0,
    );
  }
}
