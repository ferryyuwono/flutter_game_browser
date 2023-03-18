import 'package:flutter/material.dart';
import 'package:game_browser/game_browser.dart';
import 'package:get_it/get_it.dart';

class GameBrowserApp extends StatefulWidget {
  const GameBrowserApp({Key? key}) : super(key: key);

  @override
  State<GameBrowserApp> createState() => _GameBrowserAppState();
}

class _GameBrowserAppState extends State<GameBrowserApp> {
  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        initialRoutes: [ const HomeRoute() ]
      ),
      routeInformationParser: _appRouter.defaultRouteParser()
    );
  }
}
