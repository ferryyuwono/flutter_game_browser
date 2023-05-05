import 'package:flutter/material.dart';

mixin MetacriticMixin {
  Color getMetacriticColor(int score) {
    if (score >= 75) {
      return Colors.green;
    }

    if (score >= 50) {
      return Colors.yellow;
    }

    return Colors.red;
  }

  Color getMetacriticTextColor(int score) {
    if (score >= 75) {
      return Colors.white;
    }

    if (score >= 50) {
      return Colors.black;
    }

    return Colors.white;
  }
}
