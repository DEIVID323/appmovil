import 'package:jdphotomap/src/features/signup/domain/entity/signup_entity.dart';

abstract interface class SignupRepository {
  Future<void> signUp({required SignupEntity entity});
}
