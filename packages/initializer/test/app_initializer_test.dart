import 'package:flutter_test/flutter_test.dart';
import 'package:initializer/initializer.dart';
import 'package:mocktail/mocktail.dart';

class MockAppConfig extends Mock implements ApplicationConfig {}

void main() {
  group('AppInitializer', () {
    final appInitializer = AppInitializer();

    setUp(() {});

    test('when init is called, should call app config init', () async {
      // When
      final result = await appInitializer.init();

      // Expect
      expect(result, true);
    });

    tearDown(() {});
  });
}
