import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';

Future<void> userSeesDetailOfGameWithNoImage(WidgetTester tester) async {
  expect(find.byKey(const Key(GameDetailPage.headerNoImageKey)), findsOneWidget);
}
