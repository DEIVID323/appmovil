import 'package:flutter/material.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    required this.label,
    this.onPressed,
    this.color = Constants.secondaryColor,
    this.textColor = Constants.primaryColor,
    super.key,
  });
  final String label;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: Constants.borderRadius,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Constants.paddingValue * 2,
            ),
            child: Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
