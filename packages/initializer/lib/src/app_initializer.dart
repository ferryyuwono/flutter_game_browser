import 'package:common/common.dart';
import 'package:data/data.dart';
import 'package:domain_game/domain_game.dart';
import 'package:data_game/data_game.dart';
import 'package:feature_dashboard/feature_dashboard.dart';
import 'package:feature_detail/feature_detail.dart';
import 'package:feature_home/feature_home.dart';
import 'package:initializer/initializer.dart';

abstract class ApplicationConfig extends Config {}

class AppInitializer {
  AppInitializer();

  bool isInitialized = false;

  Future<bool> init() async {
    await DataConfig.getInstance().init();
    await DataGameConfig.getInstance().init();
    await DomainGameConfig.getInstance().init();
    await FeatureDashboardConfig.getInstance().init();
    await FeatureDetailConfig.getInstance().init();
    await FeatureHomeConfig.getInstance().init();
    await AppConfig.getInstance().init();
    return Future.value(true);
  }
}
