import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

sealed class AppDatasource {
  Stream<Map<String, dynamic>?> authStatus();
  Future<void> signOut();
}

class IAppDatasource implements AppDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? get _uid => _firebaseAuth.currentUser?.uid;

  @override
  Stream<Map<String, dynamic>?> authStatus() {
    return _firebaseAuth.userChanges().asyncMap((User? user) async {
      if (user == null) {
        return null;
      }
      final Map<String, dynamic>? userData = await _userData();

      if (userData != null) {
        return <String, dynamic>{
          'uid': user.uid,
          'email': user.email,
          'name': userData['name'] as String,
        };
      }

      return null;
    });
  }

  Future<Map<String, dynamic>?> _userData() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .doc(_uid)
          .get();
      if (!snapshot.exists) {
        await signOut();
        throw Exception('Usuario no encontrado');
      }
      return snapshot.data();
    } catch (e) {
      throw Exception('Error obteniendo datos: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
