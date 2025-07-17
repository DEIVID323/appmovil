import 'package:jdphotomap/src/features/app/domain/entity/custom_user_entity.dart';

abstract interface class AppRepository {
  Stream<CustomUserEntity?> authStatus();
  Future<void> signOut();
}
