import 'package:bloc_test/bloc_test.dart';
import 'package:domain_game/domain_game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';
import 'package:mocktail/mocktail.dart';

class MockGetGamesUseCase extends Mock implements GetGamesUseCase {}

void main() {
  group('HomeBloc', () {
    late HomeBloc bloc;
    final getGamesUseCase = MockGetGamesUseCase();
    const getGamesResult = GetGamesOutput(
      data: [],
      page: 1,
      isSuccess: true,
      nextUrl: '',
      isLastPage: true
    );
    final startDate = DateTime(2022, 3, 16);
    final endDate = DateTime(2023, 3, 16);

    setUp(() {
      bloc = HomeBloc(getGamesUseCase);
    });

    test('when created, should has correct initialState', () {
      expect(bloc.state, HomeState());
    });

    blocTest<HomeBloc, HomeState>(
      'when input HomeGameInitializedEvent, should return get games result',
      setUp: () {
        when(() =>
          getGamesUseCase.execute(
            GetGamesInput(
              page: 1,
              startDate: startDate,
              endDate: endDate
            )
          ))
          .thenAnswer((_) => Future.value(getGamesResult));
      },
      build: () => bloc,
      act: (bloc) {
        bloc.add(HomeGetGameEvent(
          page: 1,
          startDate: startDate,
          endDate: endDate
        ));
      },
      expect: () => <HomeState>[
        HomeState(isShimmerLoading: true),
        HomeState(games: getGamesResult, isShimmerLoading: false),
      ],
    );

    tearDown(() {
      bloc.close();
    });
  });
}
