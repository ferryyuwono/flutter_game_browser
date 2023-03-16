import 'package:common/common.dart';
import 'package:data/data.dart';
import 'package:domain_game/domain_game.dart';
import 'package:data_game/data_game.dart';

abstract class ApplicationConfig extends Config {}

class AppInitializer {
  AppInitializer(this._applicationConfig);

  final ApplicationConfig _applicationConfig;

  Future<void> init() async {
    await DataConfig.getInstance().init();
    await DataGameConfig.getInstance().init();
    await DomainGameConfig.getInstance().init();
    await _applicationConfig.init();
  }
}
