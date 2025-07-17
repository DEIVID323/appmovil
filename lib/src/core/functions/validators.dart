class Validators {
  //empty validator
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo no puede estar vacío';
    }
    return null;
  }

  /// Validates the email using a regex pattern.
  static String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor ingresa un correo electrónico válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Por favor ingresa una contraseña válida';
    }
    return null;
  }
}
