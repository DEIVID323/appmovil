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

  BorderRadius get borderRadius => Constants.borderRadius * 2;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: Border.all(color: Constants.primaryColor, width: 2),
      ),

      child: InkWell(
        borderRadius: borderRadius,
        onTap: onPressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Constants.paddingValue * 3,
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
