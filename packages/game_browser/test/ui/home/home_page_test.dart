// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/home_page_is_shown.dart';
import './step/home_page_receives_game_list.dart';
import './step/user_sees_list_of_game.dart';

void main() {
  group('''Home''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await homePageIsShown(tester);
    }
    testWidgets('''Show Games List''', (tester) async {
      await bddSetUp(tester);
      await homePageReceivesGameList(tester);
      await userSeesListOfGame(tester);
    });
  });
}
