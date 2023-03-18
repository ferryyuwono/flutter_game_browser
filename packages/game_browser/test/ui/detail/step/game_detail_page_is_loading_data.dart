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
    emit(state.copyWith(isShimmerLoading: true));
  }
}

Future<void> gameDetailPageIsLoadingData(WidgetTester tester) async {
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
  await tester.pump();
}
