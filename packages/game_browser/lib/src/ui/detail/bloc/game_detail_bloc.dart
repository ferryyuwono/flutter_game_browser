import 'dart:async';

import 'package:domain_game/domain_game.dart';
import 'package:game_browser/game_browser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class GameDetailBloc extends Bloc<GameDetailEvent, GameDetailState> {
  GameDetailBloc(super.initialState);
}

@Injectable(as: GameDetailBloc)
class GameDetailBlocImpl extends GameDetailBloc {
  final GetGameDetailUseCase _getGameDetailUseCase;

  GameDetailBlocImpl(this._getGameDetailUseCase) : super(
    GameDetailState(gameDetail: GetGameDetailOutput(
      data: GameDetail(released: DateTime(0))
    ))
  ) {
    on<GameDetailInitializedEvent>(
      (event, emit) => _onGetGameDetail(event.id, emit),
    );

    on<GameDetailGameRefreshedEvent>(
      (event, emit) => _onGetGameDetail(event.id, emit),
    );
  }

  FutureOr<void> _onGetGameDetail(int gameId, Emitter<GameDetailState> emit) async {
    await _getGameDetail(
      emit: emit,
      request: GetGameDetailInput(
        id: gameId,
      ),
    );
  }

  Future<void> _getGameDetail({
    required Emitter<GameDetailState> emit,
    required GetGameDetailInput request,
  }) async {
    try {
      emit(state.copyWith(isShimmerLoading: true));
      final output = await _getGameDetailUseCase.execute(request);
      emit(state.copyWith(
        gameDetail: output,
        isShimmerLoading: false,
      ));
    } catch(e) {
      emit(
        state.copyWith(
          gameDetail: state.gameDetail.copyWith(
            isSuccess: false
          ),
          isShimmerLoading: false,
        )
      );
    }
  }
}
