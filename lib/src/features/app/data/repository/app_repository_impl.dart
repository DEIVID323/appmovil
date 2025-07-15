import 'package:jdphotomap/src/features/app/data/datasource/app_datasource.dart';
import 'package:jdphotomap/src/features/app/data/model/custom_user_model.dart';
import 'package:jdphotomap/src/features/app/domain/repository/app_repository.dart';

class IAppRepository implements AppRepository {
  IAppRepository({required AppDatasource datasource})
    : _datasource = datasource;
  final AppDatasource _datasource;

  @override
  Stream<CustomUserModel?> authStatus() {
    final Stream<Map<String, dynamic>?> response = _datasource.authStatus();

    return response.map((Map<String, dynamic>? data) {
      if (data == null) {
        return null;
      }
      return CustomUserModel.fromJson(json: data);
    });
  }

  @override
  Future<void> signOut() => _datasource.signOut();
}
