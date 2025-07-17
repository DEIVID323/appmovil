import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  // Método estático para mostrar una notificación de error
  static void showError({
    required BuildContext context,
    required String message,
    String title = 'Error',
    List<BoxShadow>? boxShadow,
    BorderRadiusGeometry? borderRadius,
  }) {
    _showToastification(
      context: context,
      title: title,
      message: message,
      primaryColor: Colors.red,
      type: ToastificationType.error,
      boxShadow: boxShadow,
      borderRadius: borderRadius,
    );
  }

  // Método estático para mostrar una notificación de éxito
  static void showSuccess({
    required BuildContext context,
    required String message,
    String title = 'Success',
    List<BoxShadow>? boxShadow,
    BorderRadiusGeometry? borderRadius,
  }) {
    _showToastification(
      context: context,
      title: title,
      message: message,
      primaryColor: Colors.green,
      type: ToastificationType.success,
      boxShadow: boxShadow,
      borderRadius: borderRadius,
    );
  }

  // Método interno que configura la notificación
  static void _showToastification({
    required BuildContext context,
    required String title,
    required String message,
    required Color primaryColor,
    required ToastificationType type,
    List<BoxShadow>? boxShadow,
    BorderRadiusGeometry? borderRadius,
  }) {
    final ThemeData theme = Theme.of(context);
    toastification.dismissAll();
    toastification.show(
      context: context,
      title: Text(title, style: theme.textTheme.bodyLarge),
      description: Text(message, style: theme.textTheme.labelMedium),
      backgroundColor: theme.cardColor,
      boxShadow: boxShadow,
      autoCloseDuration: const Duration(seconds: 3),
      primaryColor: primaryColor,
      type: type,
      style: ToastificationStyle.flat,
      showIcon: true,
      borderRadius: borderRadius,
      borderSide: BorderSide(color: theme.cardColor),
      animationBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Alignment alignment,
            Widget child,
          ) {
            final CurvedAnimation bounce = CurvedAnimation(
              parent: animation,
              curve: Curves.bounceIn,
              reverseCurve: Curves.linear,
            );
            final CurveTween normalCurve = CurveTween(curve: Curves.easeInOut);
            return FadeTransition(
              opacity: animation.drive(
                Tween<double>(begin: 0, end: 1).chain(normalCurve),
              ),
              child: ScaleTransition(
                scale: bounce,
                alignment: Alignment.topCenter,
                child: SlideTransition(
                  position: animation.drive<Offset>(
                    Tween<Offset>(
                      begin: const Offset(0, -.4),
                      end: Offset.zero,
                    ).chain(normalCurve),
                  ),
                  child: child,
                ),
              ),
            );
          },
    );
  }
}
