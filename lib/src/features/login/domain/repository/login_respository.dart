import 'package:jdphotomap/src/features/login/domain/entity/login_entity.dart';

abstract interface class LoginRepository {
  Future<void> login({required LoginEntity loginEntity});
}
