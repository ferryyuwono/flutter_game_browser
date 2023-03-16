import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:game_browser/game_browser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGamesUseCase _getGamesUseCase;

  HomeBloc(this._getGamesUseCase) : super(HomeState()) {
    on<HomePageInitiated>(
      _onHomePageInitiated,
    );

    on<HomeGetGames>(
      _onUserLoadMore,
    );
  }

  FutureOr<void> _onHomePageInitiated(HomePageInitiated event, Emitter<HomeState> emit) async {
    final endDate = DateTime.now();
    final startDate = DateTime(endDate.year - 1, endDate.month, endDate.day);
    await _getGames(
      emit: emit,
      request: GetGamesInitialized(
        startDate: startDate,
        endDate: endDate
      ),
    );
  }

  FutureOr<void> _onUserLoadMore(HomeGetGames event, Emitter<HomeState> emit) async {
    await _getGames(
      emit: emit,
      request: GetGamesLoadMore(),
    );
  }

  Future<void> _getGames({
    required Emitter<HomeState> emit,
    required GetGamesInput request,
  }) async {
    try {
      final output = await _getGamesUseCase.execute(request);
      emit(state.copyWith(games: output));
    } catch(e) {
      emit(
        state.copyWith(
          games: state.games.copyWith(
            isSuccess: false
          )
        )
      );
    }
  }
}
