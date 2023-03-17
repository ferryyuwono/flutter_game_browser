import 'package:domain_game/domain_game.dart';
import 'package:domain_game/src/use_case/get_game_detail_use_case.dart';
import 'package:domain_game/src/use_case/mapper/get_game_detail_input_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  group('GetGameDetailUseCase', () {
    final repository = MockGameRepository();
    final getGameDetailInputMapper = GetGameDetailInputMapper();
    final getGameDetailUseCase = GetGameDetailUseCase(
      repository,
      getGameDetailInputMapper
    );

    setUp(() {});

    test('when execute is called, should return correct data', () async {
      // Given
      const id = 437049;
      final response = GameDetail(released: DateTime(0));
      const request = GetGameDetailRequest(
        id: id
      );

      // When
      when(() => repository.getGameDetail(request: request))
          .thenAnswer((_) => Future.value(response));
      final result = await getGameDetailUseCase.execute(
        const GetGameDetailInput(
          id: id
        )
      );

      // Then
      final expected = GetGameDetailOutput(
        data: response,
        isSuccess: true,
      );
      expect(result, expected);
    });

    tearDown(() {});
  });
}
