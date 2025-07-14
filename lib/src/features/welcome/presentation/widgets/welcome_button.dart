import 'package:flutter/material.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    required this.label,
    this.onPressed,
    this.color = Constants.secondaryColor,
    super.key,
  });
  final String label;
  final VoidCallback? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: Constants.borderRadius,
      ),
      child: Text(label),
    );
  }
}
