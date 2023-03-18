import 'package:auto_route/auto_route.dart';
import 'package:game_browser/game_browser.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: GameDetailPage),
  ],
)
class $AppRouter {}
