import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_browser/src/app/game_browser_app.dart';
import 'package:game_browser/src/config/app_config.dart';
import 'package:initializer/initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer(AppConfig.getInstance()).init();
  await runZonedGuarded(_runApp, (error, stack) { });
}

Future<void> _runApp() async {
  runApp(const GameBrowserApp());
}
