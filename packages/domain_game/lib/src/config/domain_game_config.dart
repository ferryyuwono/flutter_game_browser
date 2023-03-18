import 'package:common/common.dart';

import '../di/di.dart' as di;

class DomainGameConfig extends Config {
  factory DomainGameConfig.getInstance() {
    return _instance;
  }

  DomainGameConfig._();

  static final DomainGameConfig _instance = DomainGameConfig._();

  @override
  Future<bool> config() async {
    await di.configureInjection();
    return Future.value(true);
  }
}
