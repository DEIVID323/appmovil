import 'package:firebase_auth/firebase_auth.dart';
import 'package:jdphotomap/src/features/app/domain/repository/app_repository.dart';

class AppUsecase {
  AppUsecase({required AppRepository appRepository})
    : _appRepository = appRepository;

  final AppRepository _appRepository;

  Stream<User?> authStatus() => _appRepository.authStatus();
  Future<void> signOut() => _appRepository.signOut();
}
