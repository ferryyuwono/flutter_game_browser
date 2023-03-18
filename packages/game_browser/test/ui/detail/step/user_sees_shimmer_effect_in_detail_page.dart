import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_browser/game_browser.dart';

Future<void> userSeesShimmerEffectInDetailPage(WidgetTester tester) async {
  expect(find.byKey(const Key(GameDetailPage.bodyLoadingKey)), findsOneWidget);
}