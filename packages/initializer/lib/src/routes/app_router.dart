import 'package:auto_route/auto_route.dart';
import 'package:feature/feature.dart';
import 'package:feature_dashboard/feature_dashboard.dart';
import 'package:feature_detail/feature_detail.dart';
import 'package:feature_home/feature_home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: FeaturePath.dashboard, page: DashboardPage),
    AutoRoute(path: FeaturePath.games, page: HomePage),
    AutoRoute(path: FeaturePath.gameDetail, page: GameDetailPage),
  ],
)
class $AppRouter {}
