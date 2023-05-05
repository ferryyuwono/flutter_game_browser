import 'package:auto_route/annotations.dart';
import 'package:common/common.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:feature_detail/feature_detail.dart';
import 'package:get_it/get_it.dart';

import 'game_detail_page_is_shown.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: FeaturePath.gameDetail, page: GameDetailPage),
  ],
)
class $MockAppRouter {}

class MockAppConfig extends Config {
  factory MockAppConfig.getInstance() {
    return _instance;
  }

  MockAppConfig._();

  static final MockAppConfig _instance = MockAppConfig._();

  @override
  Future<bool> config() {
    GetIt.instance.registerSingleton<MockAppRouter>(MockAppRouter());
    return Future.value(true);
  }
}

Future<void> gameDetailPageIsShown(WidgetTester tester) async {
  WidgetsFlutterBinding.ensureInitialized();
  await MockAppConfig.getInstance().init();
}
