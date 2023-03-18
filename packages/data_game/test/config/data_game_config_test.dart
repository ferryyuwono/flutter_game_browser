import 'package:data_game/data_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DataGameConfig', () {
    final config = DataGameConfig.getInstance();

    setUp(() {});

    test('when init is called, should return future true', () async {
      // When
      final result = await config.init();

      // Expect
      expect(result, true);
    });

    tearDown(() {});
  });
}
