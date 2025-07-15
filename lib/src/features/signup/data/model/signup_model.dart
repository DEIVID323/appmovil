import 'package:jdphotomap/src/features/signup/domain/entity/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel({
    required super.username,
    required super.email,
    required super.password,
  });

  factory SignupModel.fromEntity(SignupEntity entity) {
    return SignupModel(
      username: entity.username,
      email: entity.email,
      password: entity.password,
    );
  }
}
