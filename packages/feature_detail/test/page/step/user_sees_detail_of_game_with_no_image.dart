import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:feature_detail/feature_detail.dart';

Future<void> userSeesDetailOfGameWithNoImage(WidgetTester tester) async {
  expect(find.byKey(const Key(GameDetailPage.headerNoImageKey)), findsOneWidget);
}
