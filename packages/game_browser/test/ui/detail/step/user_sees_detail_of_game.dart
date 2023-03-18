import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';

Future<void> userSeesDetailOfGame(WidgetTester tester) async {
  expect(find.byKey(const Key(GameDetailPage.bodyDescriptionKey)), findsOneWidget);
}
