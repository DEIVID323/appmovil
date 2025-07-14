import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData? _instance;

  static ThemeData get instance {
    if (_instance == null) {
      throw Exception('DarkTheme is not initialized with context');
    }
    return _instance!;
  }

  static void initialize(BuildContext context) {
    _instance = _createDarkTheme(context);
  }

  static ThemeData _createDarkTheme(BuildContext context) {
    return ThemeData(brightness: Brightness.dark, fontFamily: 'NunitoSans');
  }
}
