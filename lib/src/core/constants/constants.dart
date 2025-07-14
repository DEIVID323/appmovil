import 'package:flutter/widgets.dart';

class Constants {
  static const double paddingValue = 6.0;
  static const EdgeInsets contentPadding = EdgeInsets.all(paddingValue * 2.0);
  static const double borderRadiusValue = 22.0;
  static const Color primaryColor = Color(0xFF4867B7);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const BorderRadius borderRadius = BorderRadius.all(
    Radius.circular(borderRadiusValue),
  );
}
