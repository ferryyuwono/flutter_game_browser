import 'package:bloc_test/bloc_test.dart';
import 'package:domain_game/domain_game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';
import 'package:mocktail/mocktail.dart';

class MockGetGameDetailUseCase extends Mock implements GetGameDetailUseCase {}

void main() {
  group('GameDetailBlocImpl', () {
    late GameDetailBlocImpl bloc;
    final getGameDetailUseCase = MockGetGameDetailUseCase();
    const gameId = 43407;
    final initialState = GameDetailState(
      gameDetail: GetGameDetailOutput(
        data: GameDetail(released: DateTime(0)),
      ),
    );
    final getGameDetailResult = GetGameDetailOutput(
      data: GameDetail(id: gameId, released: DateTime(0)),
      isSuccess: true,
    );

    setUp(() {
      bloc = GameDetailBlocImpl(getGameDetailUseCase);
    });

    test('when created, should has correct initialState', () {
      expect(bloc.state, initialState);
    });

    blocTest<GameDetailBloc, GameDetailState>(
      'when input GetGameDetailInput, should return get game detail result',
      setUp: () {
        when(() =>
          getGameDetailUseCase.execute(
            const GetGameDetailInput(
              id: gameId
            )
          ))
          .thenAnswer((_) => Future.value(getGameDetailResult));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(
          const GameDetailInitializedEvent(
            id: gameId,
          )
        );
      },
      expect: () => <GameDetailState>[
        GameDetailState(
          gameDetail: initialState.gameDetail,
          isShimmerLoading: true
        ),
        GameDetailState(
          gameDetail: getGameDetailResult,
          isShimmerLoading: false
        ),
      ],
    );

    tearDown(() {
      bloc.close();
    });
  });
}
