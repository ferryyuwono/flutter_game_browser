import 'package:flutter/material.dart';

abstract class MetacriticHelper {
  static Color getMetacriticColor(int score) {
    if (score >= 75) {
      return Colors.green;
    }

    if (score >= 50) {
      return Colors.yellow;
    }

    return Colors.red;
  }

  static Color getMetacriticTextColor(int score) {
    if (score >= 75) {
      return Colors.white;
    }

    if (score >= 50) {
      return Colors.black;
    }

    return Colors.white;
  }
}
