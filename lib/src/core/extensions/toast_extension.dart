import 'package:flutter/widgets.dart';
import 'package:shared/custom_toast.dart';

extension ToastExtension on BuildContext {
  void showErrorToast(String message) {
    CustomToast.showError(context: this, message: message);
  }

  void showSuccessToast(String message) {
    CustomToast.showSuccess(context: this, message: message);
  }
}
