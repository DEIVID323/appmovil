import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jdphotomap/src/features/signup/data/model/signup_model.dart';

sealed class SignupDatasource {
  Future<void> signUp({required SignupModel model});
}

class ISignupDatasource implements SignupDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? get _uid => _auth.currentUser?.uid;

  @override
  Future<void> signUp({required SignupModel model}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      if (_uid == null) {
        throw Exception('User ID is null after signup');
      }

      await _firestore.collection('users').doc(_uid).set(<String, dynamic>{
        'name': model.username,
      });
    } on FirebaseAuthException catch (e) {
      throw Exception('Signup failed: ${e.message}');
    } catch (e) {
      throw Exception('An error occurred during signup: $e');
    }
  }
}
