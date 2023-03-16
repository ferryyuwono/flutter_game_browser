import 'package:auto_route/auto_route.dart';
import 'package:game_browser/game_browser.dart';

// ignore_for_file:avoid-dynamic
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
  ],
)
class $AppRouter {}
