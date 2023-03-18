import 'package:domain_game/domain_game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DomainGameConfig', () {
    final config = DomainGameConfig.getInstance();

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
