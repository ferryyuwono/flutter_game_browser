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

  FutureOr<void> _onGetGameDetail(GameDetailInitializedEvent event, Emitter<GameDetailState> emit) async {}
}

Future<void> userTapOnGame(WidgetTester tester) async {
  GetIt.instance.registerSingleton<GameDetailBloc>(MockGameDetailBloc());

  await tester.tap(
    find.byKey(const Key('${HomePage.bodyListGameKey}.0')),
  );
  await tester.pumpAndSettle();
}
