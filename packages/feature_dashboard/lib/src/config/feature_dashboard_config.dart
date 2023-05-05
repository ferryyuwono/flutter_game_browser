import 'package:common/common.dart';

import '../di/di.dart' as di;

class FeatureDashboardConfig extends Config {
  factory FeatureDashboardConfig.getInstance() {
    return _instance;
  }

  FeatureDashboardConfig._();

  static final FeatureDashboardConfig _instance = FeatureDashboardConfig._();

  @override
  Future<bool> config() async {
    await di.configureInjection();
    return Future.value(true);
  }
}
