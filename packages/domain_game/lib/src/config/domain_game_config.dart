import 'package:common/common.dart';

import '../di/di.dart' as di;

class DomainGameConfig extends Config {
  factory DomainGameConfig.getInstance() {
    return _instance;
  }

  DomainGameConfig._();

  static final DomainGameConfig _instance = DomainGameConfig._();

  @override
  Future<void> config() async {
    await di.configureInjection();
  }
}
