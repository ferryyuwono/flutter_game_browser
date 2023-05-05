import 'package:common/common.dart';
import 'package:initializer/initializer.dart';

import '../di/di.dart' as di;

class AppConfig extends Config {
  factory AppConfig.getInstance() {
    return _instance;
  }

  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  @override
  Future<bool> config() async {
    await di.configureInjection();
    di.getIt.registerSingleton<AppRouter>(AppRouter());
    return Future.value(true);
  }
}
