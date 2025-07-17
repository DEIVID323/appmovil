import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.text,
    required this.contentPadding,
    required this.color,
    required this.borderRadius,
    this.onTap,
    super.key,
  });

  final void Function(BuildContext context)? onTap;
  final String text;
  final EdgeInsets contentPadding;
  final Color color;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(context),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        child: Padding(
          padding: contentPadding,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
