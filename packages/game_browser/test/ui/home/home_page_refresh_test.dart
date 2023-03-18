// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/home_page_is_shown.dart';
import './step/home_page_receives_data.dart';
import './step/user_sees_list_of_game.dart';
import './step/user_pull_to_refresh_the_page.dart';

void main() {
  group('''Home''', () {
    testWidgets('''Refresh Game List''', (tester) async {
      await homePageIsShown(tester);
      await homePageReceivesData(tester);
      await userSeesListOfGame(tester);
      await userPullToRefreshThePage(tester);
      await userSeesListOfGame(tester);
    });
  });
}