import 'package:flutter/material.dart';

class MultipleWidgets {
  static SnackBar gSnackBar(String text) {
    return SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    );
  }
}
