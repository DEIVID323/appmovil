import 'package:jdphotomap/src/features/login/domain/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.email, required super.password});

  static LoginModel fromEntity(LoginEntity entity) {
    return LoginModel(email: entity.email, password: entity.password);
  }
}
