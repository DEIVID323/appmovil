import 'package:jdphotomap/src/features/signup/data/datasource/signup_datasource.dart';
import 'package:jdphotomap/src/features/signup/data/model/signup_model.dart';
import 'package:jdphotomap/src/features/signup/domain/entity/signup_entity.dart';
import 'package:jdphotomap/src/features/signup/domain/repository/signup_repository.dart';

class ISignupRepository implements SignupRepository {
  ISignupRepository({required SignupDatasource datasource})
    : _datasource = datasource;

  final SignupDatasource _datasource;

  @override
  Future<void> signUp({required SignupEntity entity}) async {
    final SignupModel model = SignupModel.fromEntity(entity);
    await _datasource.signUp(model: model);
  }
}
