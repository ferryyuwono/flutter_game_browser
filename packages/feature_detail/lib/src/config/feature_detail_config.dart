import 'package:common/common.dart';

import '../di/di.dart' as di;

class FeatureDetailConfig extends Config {
  factory FeatureDetailConfig.getInstance() {
    return _instance;
  }

  FeatureDetailConfig._();

  static final FeatureDetailConfig _instance = FeatureDetailConfig._();

  @override
  Future<bool> config() async {
    await di.configureInjection();
    return Future.value(true);
  }
}
