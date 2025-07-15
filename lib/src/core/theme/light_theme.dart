import 'package:flutter/material.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';

class LightTheme {
  static ThemeData? _instance;

  static ThemeData get instance {
    if (_instance == null) {
      throw Exception('LightTheme is not initialized with context');
    }
    return _instance!;
  }

  static void initialize(BuildContext context) {
    _instance = _createLightTheme(context);
  }

  static ThemeData _createLightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'NunitoSans',
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Constants.primaryColor.withValues(alpha: .1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20.0,
        ),
        border: const OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
      ),
      pageTransitionsTheme: Constants.pageTransition,
      colorScheme: const ColorScheme.light(
        primary: Constants.primaryColor,
        secondary: Constants.secondaryColor,
      ),
    );
  }
}
