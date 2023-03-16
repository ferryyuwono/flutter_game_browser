import 'package:common/common.dart';

import '../di/di.dart' as di;

class DataGameConfig extends Config {
  DataGameConfig._();

  factory DataGameConfig.getInstance() {
    return _instance;
  }

  static final DataGameConfig _instance = DataGameConfig._();

  @override
  Future<void> config() async {
    await di.configureInjection();
  }
}
