import 'package:flutter/material.dart';
import 'package:shared/loading_status.dart';

extension ShowStatusExtension on BuildContext {
  void showLoading() => showAdaptiveDialog(
    context: this,
    builder: (BuildContext context) {
      return const LoadingStatus();
    },
  );
}
