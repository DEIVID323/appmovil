import 'package:jdphotomap/src/features/login/domain/entity/login_entity.dart';
import 'package:jdphotomap/src/features/login/domain/repository/login_respository.dart';

class LoginUsecase {
  LoginUsecase({required LoginRepository loginRepository})
    : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;

  Future<void> login({required LoginEntity loginEntity}) async {
    await _loginRepository.login(loginEntity: loginEntity);
  }
}
