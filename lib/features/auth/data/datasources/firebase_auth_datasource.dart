import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:multitec_app/features/user/data/dtos/user_dto.dart';

class FirebaseAuthDataSource {
  FirebaseAuthDataSource({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  Future<void> signInWithGoogle() async {
    final provider = firebase_auth.GoogleAuthProvider();
    if (kIsWeb) {
      try {
        await _firebaseAuth.signInWithPopup(provider);
      } on Object {
        await _firebaseAuth.signInWithRedirect(provider);
      }
      return;
    }
    await _firebaseAuth.signInWithProvider(provider);
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
