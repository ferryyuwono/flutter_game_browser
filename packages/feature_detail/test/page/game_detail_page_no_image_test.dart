// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'step/game_detail_page_is_shown.dart';
import 'step/game_detail_page_receives_data_with_no_image.dart';
import 'step/user_sees_detail_of_game_with_no_image.dart';

void main() {
  group('''Game Detail''', () {
    testWidgets('''Show Game Detail with No Image''', (tester) async {
      await gameDetailPageIsShown(tester);
      await gameDetailPageReceivesDataWithNoImage(tester);
      await userSeesDetailOfGameWithNoImage(tester);
    });
  });
}
