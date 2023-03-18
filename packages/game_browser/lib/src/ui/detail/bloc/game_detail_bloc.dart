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
      _onGetGameDetail,
    );
  }

  FutureOr<void> _onGetGameDetail(GameDetailInitializedEvent event, Emitter<GameDetailState> emit) async {
    await _getGameDetail(
      emit: emit,
      request: GetGameDetailInput(
        id: event.id,
      ),
    );
  }

  Future<void> _getGameDetail({
    required Emitter<GameDetailState> emit,
    required GetGameDetailInput request,
  }) async {
    emit(state.copyWith(isShimmerLoading: true));
    final output = await _getGameDetailUseCase.execute(request);
    emit(state.copyWith(
      gameDetail: output,
      isShimmerLoading: false,
    ));
  }
}
