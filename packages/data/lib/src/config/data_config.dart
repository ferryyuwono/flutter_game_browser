import 'package:common/common.dart';
import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

import '../di/di.dart' as di;

class DataConfig extends Config {
  DataConfig._();

  factory DataConfig.getInstance() {
    return _instance;
  }

  static final DataConfig _instance = DataConfig._();

  @override
  Future<void> config() async {
    await di.configureInjection();
  }
}
