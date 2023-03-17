import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';

Future<void> userSeesListOfGame(WidgetTester tester) async {
  expect(find.byKey(const Key(HomePage.gameListKey)), findsOneWidget);
  await tester.pumpAndSettle();
}
