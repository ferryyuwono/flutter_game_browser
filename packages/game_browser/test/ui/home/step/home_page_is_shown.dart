import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';
import 'package:get_it/get_it.dart';
import 'package:initializer/initializer.dart';

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
        isLastPage: false,
        page: event.page,
        nextUrl: '',
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
        nextUrl: '',
      );
    }

    emit(state.copyWith(
      games: output,
      isShimmerLoading: false,
    ));
  }

  FutureOr<void> _onHomePageRefreshed(HomeGameRefreshedEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(games: const GetGamesOutput(data: [])));
  }
}

class MockAppConfig extends ApplicationConfig {
  MockAppConfig();

  @override
  Future<void> config() async {
    GetIt.instance.registerSingleton<HomeBloc>(MockHomeBloc());
  }
}

Future<void> homePageIsShown(WidgetTester tester) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer(MockAppConfig()).init();

  const home = MaterialApp(
    title: 'Mock',
    home: HomePage(),
  );
  await tester.pumpWidget(home);

  expect(find.byKey(const Key(HomePage.screenKey)), findsOneWidget);
  await tester.pumpAndSettle();
}
