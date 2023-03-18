import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';
import 'package:get_it/get_it.dart';

class MockHomeBloc extends HomeBloc {
  MockHomeBloc() : super(HomeState()) {
    on<HomeGetGameEvent>(
      _onHomeGetGame
    );

    on<HomeGameRefreshedEvent>(
      _onHomePageRefreshed
    );
  }

  FutureOr<void> _onHomeGetGame(HomeGetGameEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isShimmerLoading: true));
  }

  FutureOr<void> _onHomePageRefreshed(HomeGameRefreshedEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(games: const GetGamesOutput(data: [])));
  }
}

Future<void> homePageIsLoadingData(WidgetTester tester) async {
  GetIt.instance.registerSingleton<HomeBloc>(MockHomeBloc());

  final appRouter = GetIt.instance.get<AppRouter>();
  final app = MaterialApp.router(
    routerDelegate: appRouter.delegate(
      initialRoutes: [ const HomeRoute() ]
    ),
    routeInformationParser: appRouter.defaultRouteParser()
  );
  await tester.pumpWidget(app);
  await tester.pump();

  expect(find.byKey(const Key(HomePage.screenKey)), findsOneWidget);
  await tester.pump();
}
