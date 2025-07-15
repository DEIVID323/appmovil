import 'package:firebase_auth/firebase_auth.dart';
import 'package:jdphotomap/src/features/app/data/datasource/app_datasource.dart';
import 'package:jdphotomap/src/features/app/domain/repository/app_repository.dart';

class IAppRepository implements AppRepository {
  IAppRepository({required AppDatasource datasource})
    : _datasource = datasource;
  final AppDatasource _datasource;

  @override
  Stream<User?> authStatus() {
    return _datasource.authStatus();
  }

  @override
  Future<void> signOut() => _datasource.signOut();
}
