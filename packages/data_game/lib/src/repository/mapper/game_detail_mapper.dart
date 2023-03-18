import 'package:data_game/data_game.dart';
import 'package:domain_game/domain_game.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GameDetailMapper {
  GameDetailMapper();

  GameDetail map(GameDetailData data) {
    return GameDetail(
      id: data.id ?? 0,
      name: data.name ?? '',
      backgroundImage: data.backgroundImage ?? '',
      released: data.released != null ?
        DateTime.parse(data.released ?? '') :
        DateTime(0),
      metacritic: data.metacritic ?? 0,
      reviewsCount: data.reviewsCount ?? 0,
      description: data.description ?? '',
      genres: data.genres?.map((e) => Genre(
        id: e.id ?? 0,
        name: e.name ?? '',
      )).toList() ?? [],
      platforms: data.platforms?.map((e) => PlatformRequirement(
        platform: Platform(
          id: e.platform?.id ?? 0,
          name: e.platform?.name ?? '',
        ),
      )).toList() ?? [],
      developers: data.developers?.map((e) => Developer(
        id: e.id ?? 0,
        name: e.name ?? '',
      )).toList() ?? [],
      publishers: data.publishers?.map((e) => Publisher(
        id: e.id ?? 0,
        name: e.name ?? '',
      )).toList() ?? [],
    );
  }
}
