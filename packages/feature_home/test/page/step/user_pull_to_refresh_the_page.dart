import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:feature_home/feature_home.dart';

Future<void> userPullToRefreshThePage(WidgetTester tester) async {
  await tester.fling(
    find.byKey(const Key('${GameList.bodyListGameKey}.0')),
    const Offset(0.0, 300.0),
    1000.0
  );
  await tester.pumpAndSettle();
}
