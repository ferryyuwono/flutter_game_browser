// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/home_page_is_shown.dart';
import './step/home_page_is_loading_data.dart';
import './step/user_sees_shimmer_effect_in_home_page.dart';

void main() {
  group('''Home''', () {
    testWidgets('''Show Game List''', (tester) async {
      await homePageIsShown(tester);
      await homePageIsLoadingData(tester);
      await userSeesShimmerEffectInHomePage(tester);
    });
  });
}
