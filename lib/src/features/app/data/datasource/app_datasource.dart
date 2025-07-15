import 'package:firebase_auth/firebase_auth.dart';

sealed class AppDatasource {
  Stream<User?> authStatus();
  Future<void> signOut();
}

class IAppDatasource implements AppDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStatus() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
