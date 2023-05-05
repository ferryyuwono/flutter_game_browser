import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:feature_home/feature_home.dart';

Future<void> userSeesListOfGame(WidgetTester tester) async {
  expect(find.byKey(const Key(GameList.bodyListGameKey)), findsOneWidget);
}
