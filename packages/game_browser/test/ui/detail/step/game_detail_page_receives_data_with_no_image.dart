import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';
import 'package:get_it/get_it.dart';

class MockGameDetailBloc extends GameDetailBloc {
  MockGameDetailBloc() : super(GameDetailState(
      gameDetail: GetGameDetailOutput(
          data: GameDetail(released: DateTime(0))
      )
  )) {
    on<GameDetailInitializedEvent>(
      _onGetGameDetail,
    );
  }

  FutureOr<void> _onGetGameDetail(GameDetailInitializedEvent event, Emitter<GameDetailState> emit) async {
    final GetGameDetailOutput output = GetGameDetailOutput(
        data: GameDetail(
          id: 494383,
          name: "Five Nights at Freddy's: Security Breach",
          released: DateTime.parse("2021-12-16"),
          backgroundImage: "",
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

Future<void> gameDetailPageReceivesDataWithNoImage(WidgetTester tester) async {
  GetIt.instance.registerSingleton<GameDetailBloc>(MockGameDetailBloc());

  final appRouter = GetIt.instance.get<AppRouter>();
  final app = MaterialApp.router(
    routerDelegate: appRouter.delegate(
      initialRoutes: [ GameDetailRoute(gameId: 1) ]
    ),
    routeInformationParser: appRouter.defaultRouteParser()
  );
  await tester.pumpWidget(app);
  await tester.pump();

  expect(find.byKey(const Key(GameDetailPage.screenKey)), findsOneWidget);
  await tester.pumpAndSettle();
}
