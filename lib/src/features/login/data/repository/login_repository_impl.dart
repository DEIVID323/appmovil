import 'package:jdphotomap/src/features/login/data/datasource/login_datasource.dart';
import 'package:jdphotomap/src/features/login/data/model/login_model.dart';
import 'package:jdphotomap/src/features/login/domain/entity/login_entity.dart';
import 'package:jdphotomap/src/features/login/domain/repository/login_respository.dart';

class ILoginRepository implements LoginRepository {
  const ILoginRepository({required LoginDatasource datasource})
    : _datasource = datasource;

  final LoginDatasource _datasource;

  @override
  Future<void> login({required LoginEntity loginEntity}) async {
    final LoginModel loginModel = LoginModel.fromEntity(loginEntity);
    await _datasource.login(loginEntity: loginModel);
  }
}
