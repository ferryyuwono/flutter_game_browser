import 'package:flutter/material.dart';
import 'package:initializer/initializer.dart';
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
        initialRoutes: [ const DashboardRoute() ]
      ),
      routeInformationParser: _appRouter.defaultRouteParser()
    );
  }
}
