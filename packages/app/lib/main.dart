import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_browser/src/app/game_browser_app.dart';
import 'package:initializer/initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer().init();
  runApp(const GameBrowserApp());
}
