import 'package:jdphotomap/src/features/signup/domain/entity/signup_entity.dart';
import 'package:jdphotomap/src/features/signup/domain/repository/signup_repository.dart';

class SignupUsecase {
  SignupUsecase({required SignupRepository repository})
    : _repository = repository;

  final SignupRepository _repository;

  Future<void> signUp({required SignupEntity entity}) async {
    await _repository.signUp(entity: entity);
  }
}
