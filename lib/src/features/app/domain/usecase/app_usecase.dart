import 'package:jdphotomap/src/features/app/domain/entity/custom_user_entity.dart';
import 'package:jdphotomap/src/features/app/domain/repository/app_repository.dart';

class AppUsecase {
  AppUsecase({required AppRepository appRepository})
    : _appRepository = appRepository;

  final AppRepository _appRepository;

  Stream<CustomUserEntity?> authStatus() => _appRepository.authStatus();
  Future<void> signOut() => _appRepository.signOut();
}
