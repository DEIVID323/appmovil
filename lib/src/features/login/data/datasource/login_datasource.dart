import 'package:firebase_auth/firebase_auth.dart';
import 'package:jdphotomap/src/features/login/data/model/login_model.dart';

sealed class LoginDatasource {
  Future<void> login({required LoginModel loginEntity});
}

class ILoginDatasource implements LoginDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> login({required LoginModel loginEntity}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: loginEntity.email,
        password: loginEntity.password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }
}
