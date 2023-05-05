import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:feature_home/feature_home.dart';
import 'package:get_it/get_it.dart';

import 'home_page_is_shown.gr.dart';

class MockEmptyPage extends StatelessWidget {
  const MockEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: FeaturePath.games, page: HomePage),
    AutoRoute(path: FeaturePath.gameDetail, page: MockEmptyPage),
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

Future<void> homePageIsShown(WidgetTester tester) async {
  WidgetsFlutterBinding.ensureInitialized();
  await MockAppConfig.getInstance().init();
}
