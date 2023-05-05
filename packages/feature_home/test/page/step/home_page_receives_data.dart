import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:feature_home/feature_home.dart';
import 'package:get_it/get_it.dart';

import 'home_page_is_shown.gr.dart';

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
    final GetGamesOutput output;
    if (event.page == 1) {
      output = GetGamesOutput(
        data: [
          Game(
            id: 0,
            name: 'mock',
            released: DateTime.now(),
            backgroundImage: '',
            metacritic: 0,
          ),
          Game(
            id: 1,
            name: 'mock',
            released: DateTime.now(),
            backgroundImage: 'https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg',
            metacritic: 50,
          ),
          Game(
            id: 2,
            name: 'mock',
            released: DateTime.now(),
            backgroundImage: '',
            metacritic: 90,
          ),
        ],
        isSuccess: true,
        isLastPage: false,
        page: event.page,
      );
    } else {
      output = GetGamesOutput(
        data: [
          Game(
            id: 0,
            name: 'mock',
            released: DateTime.now(),
            backgroundImage: '',
            metacritic: 0,
          ),
          Game(
            id: 1,
            name: 'mock',
            released: DateTime.now(),
            backgroundImage: '',
            metacritic: 50,
          ),
          Game(
            id: 2,
            name: 'mock',
            released: DateTime.now(),
            backgroundImage: '',
            metacritic: 90,
          ),
        ],
        isSuccess: true,
        isLastPage: true,
        page: event.page,
      );
    }

    emit(state.copyWith(
      games: output,
      isShimmerLoading: false,
    ));
  }

  FutureOr<void> _onHomePageRefreshed(HomeGameRefreshedEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(games: const GetGamesOutput(data: []), isShimmerLoading: true));
  }
}

Future<void> homePageReceivesData(WidgetTester tester) async {
  GetIt.instance.registerSingleton<HomeBloc>(MockHomeBloc());

  final appRouter = GetIt.instance.get<MockAppRouter>();
  final app = MaterialApp.router(
    routerDelegate: appRouter.delegate(
      initialRoutes: [ const HomeRoute() ]
    ),
    routeInformationParser: appRouter.defaultRouteParser()
  );
  await tester.pumpWidget(app);
  await tester.pump();

  expect(find.byKey(const Key(HomePage.screenKey)), findsOneWidget);
  await tester.pumpAndSettle();
}
