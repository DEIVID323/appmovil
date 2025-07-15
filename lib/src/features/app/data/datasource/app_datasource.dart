import 'package:firebase_auth/firebase_auth.dart';

sealed class AppDatasource {
  Stream<User?> authStatus();
  Future<void> signOut();
}

class IAppDatasource implements AppDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStatus() {
    final Stream<User?> authStateChanges = _firebaseAuth.userChanges();
    authStateChanges.listen((User? user) {
      if (user != null) {
        print('User is signed in: ${user.email}');
      } else {
        print('User is signed out');
      }
    });
    return authStateChanges;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
