import 'package:feature_home/feature_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> userTapOnGame(WidgetTester tester) async {
  await tester.tap(
    find.byKey(const Key('${GameList.bodyListGameKey}.0')),
  );
  await tester.pumpAndSettle();
}
