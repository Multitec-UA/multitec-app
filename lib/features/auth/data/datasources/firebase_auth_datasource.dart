import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:multitec_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:multitec_app/features/auth/data/dtos/auth_dto.dart';

class FirebaseAuthDataSource implements AuthRemoteDataSource {
  FirebaseAuthDataSource({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  Future<AuthDTO> signInWithGoogle() async {
    final userCredential = await _firebaseAuth.signInWithProvider(
      firebase_auth.GoogleAuthProvider(),
    );

    final user = userCredential.user;
    if (user == null) {
      throw Exception('Failed to sign in with Google');
    }

    return AuthDTO.fromFirebaseUser(userCredential);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
