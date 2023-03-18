// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/game_detail_page_is_shown.dart';
import './step/game_detail_page_receives_data.dart';
import './step/user_sees_detail_of_game.dart';

void main() {
  group('''Game Detail''', () {
    testWidgets('''Show Game Detail''', (tester) async {
      await gameDetailPageIsShown(tester);
      await gameDetailPageReceivesData(tester);
      await userSeesDetailOfGame(tester);
    });
  });
}
