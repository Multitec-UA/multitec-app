import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:multitec_app/features/user/data/dtos/user_dto.dart';

class FirebaseAuthDataSource {
  FirebaseAuthDataSource({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  Future<void> signInWithGoogle() async {
    final userCredential = await _firebaseAuth.signInWithProvider(
      firebase_auth.GoogleAuthProvider(),
    );

    final user = userCredential.user;
    if (user == null) {
      //TODO: User not found (chequear si lanzarla o se lanza sola)
      throw Exception('Failed to sign in with Google');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  UserDTO? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    return UserDTO(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL,
    );
  }

  // Streams to observe authentication and token changes
  Stream<firebase_auth.User?> authStateChanges() =>
      _firebaseAuth.authStateChanges();

  Stream<String?> idTokenChanges() => _firebaseAuth
      .idTokenChanges()
      .asyncMap((u) async => u == null ? null : await u.getIdToken());

  // Helper to fetch a fresh ID token once
  Future<String?> getIdTokenOnce({bool forceRefresh = false}) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    return user.getIdToken(forceRefresh);
  }
}
