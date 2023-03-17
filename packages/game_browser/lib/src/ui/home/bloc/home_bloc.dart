import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:game_browser/game_browser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGamesUseCase _getGamesUseCase;

  HomeBloc(this._getGamesUseCase) : super(HomeState()) {
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
    try {
      emit(state.copyWith(isShimmerLoading: true));
      final output = await _getGamesUseCase.execute(request);
      emit(state.copyWith(
        games: output,
        isShimmerLoading: false,
      ));
    } catch(e) {
      emit(
        state.copyWith(
          games: state.games.copyWith(
            isSuccess: false
          ),
          isShimmerLoading: false,
        )
      );
    }
  }
}
