import 'package:common/common.dart';

import '../di/di.dart' as di;

class FeatureHomeConfig extends Config {
  factory FeatureHomeConfig.getInstance() {
    return _instance;
  }

  FeatureHomeConfig._();

  static final FeatureHomeConfig _instance = FeatureHomeConfig._();

  @override
  Future<bool> config() async {
    await di.configureInjection();
    return Future.value(true);
  }
}
