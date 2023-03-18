import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';
import 'package:get_it/get_it.dart';
import 'package:initializer/initializer.dart';

class MockGameDetailBloc extends GameDetailBloc {
  MockGameDetailBloc() : super(GameDetailState(
    gameDetail: GetGameDetailOutput(
      data: GameDetail(released: DateTime(0))
    )
  )) {
    on<GameDetailInitializedEvent>(
      (event, emit) => _onGetGameDetail(event.id, emit),
    );

    on<GameDetailGameRefreshedEvent>(
      (event, emit) => _onGetGameDetail(event.id, emit),
    );
  }

  FutureOr<void> _onGetGameDetail(int gameId, Emitter<GameDetailState> emit) async {
    emit(state.copyWith(isShimmerLoading: true));
    final GetGameDetailOutput output = GetGameDetailOutput(
      data: GameDetail(
        id: 494383,
        name: "Five Nights at Freddy's: Security Breach",
        released: DateTime.parse("2021-12-16"),
        backgroundImage: "https://media.rawg.io/media/games/f5b/f5b0a8232e747c03aa6b56ce2d2af49a.jpg",
        metacritic: 64,
        reviewsCount: 5,
        description: "Win as One in EA SPORTS™ FIFA 21, powered by Frostbite™. FIFA 21 has more ways to play than ever before - including the UEFA Champions League and CONMEBOL Libertadores. Stay tuned for exciting news to come.",
        genres: const [
          Genre(
            id: 14,
            name: "Simulation",
          ),
          Genre(
            id: 15,
            name: "Sports",
          ),
        ],
        platforms: const [
          PlatformRequirement(
              platform: Platform(
                id: 187,
                name: "PlayStation 5",
              )
          ),
          PlatformRequirement(
              platform: Platform(
                id: 7,
                name: "Nintendo Switch",
              )
          )
        ],
        developers: const [
          Developer(
            id: 109,
            name: "Electronic Arts",
          ),
        ],
        publishers: const [
          Publisher(
            id: 354,
            name: "Electronic Arts",
          ),
        ],
      )
    );
    emit(state.copyWith(
      gameDetail: output,
      isShimmerLoading: false,
    ));
  }
}

class MockAppConfig extends ApplicationConfig {
  MockAppConfig();

  @override
  Future<void> config() async {
    GetIt.instance.registerSingleton<GameDetailBloc>(MockGameDetailBloc());
  }
}

Future<void> gameDetailPageIsShown(WidgetTester tester) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer(MockAppConfig()).init();

  const home = MaterialApp(
    title: 'Mock',
    home: GameDetailPage(494383),
  );
  await tester.pumpWidget(home);

  expect(find.byKey(const Key(GameDetailPage.screenKey)), findsOneWidget);
  await tester.pumpAndSettle();
}
