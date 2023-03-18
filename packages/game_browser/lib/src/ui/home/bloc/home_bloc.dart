import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:game_browser/game_browser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState);
}

@Injectable(as: HomeBloc)
class HomeBlocImpl extends HomeBloc {
  final GetGamesUseCase _getGamesUseCase;

  HomeBlocImpl(this._getGamesUseCase) : super(HomeState()) {
    on<HomeGetGameEvent>(
      _onHomeGetGame,
    );

    on<HomeGameRefreshedEvent>(
      _onHomePageRefreshed,
    );
  }

  FutureOr<void> _onHomeGetGame(HomeGetGameEvent event, Emitter<HomeState> emit) async {
    await _getGames(
      emit: emit,
      request: GetGamesInput(
        page: event.page,
        startDate: event.startDate,
        endDate: event.endDate,
      ),
    );
  }

  FutureOr<void> _onHomePageRefreshed(HomeGameRefreshedEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(games: const GetGamesOutput(data: [])));
  }

  Future<void> _getGames({
    required Emitter<HomeState> emit,
    required GetGamesInput request,
  }) async {
    emit(state.copyWith(isShimmerLoading: true));
    final output = await _getGamesUseCase.execute(request);
    emit(state.copyWith(
      games: output,
      isShimmerLoading: false,
    ));
  }
}
