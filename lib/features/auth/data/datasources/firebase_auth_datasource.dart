import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:multitec_app/core/exceptions/app_exception.dart';
import 'package:multitec_app/features/user/data/dtos/user_dto.dart';

class FirebaseAuthDataSource {
  FirebaseAuthDataSource({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<void> signInWithGoogle() async {
    final provider = GoogleAuthProvider();
    if (kIsWeb) {
      try {
        final cred = await _firebaseAuth.signInWithPopup(provider);
        //TODO: Borrar
        //await _enforceAllowedDomainOrSignOut(cred.user);
      } on Object {
        await _firebaseAuth.signInWithRedirect(provider);
      }
      return;
    }

    final cred = await _firebaseAuth.signInWithProvider(provider);
    //TODO: Borrar
    //await _enforceAllowedDomainOrSignOut(cred.user);
  }

  Future<void> _enforceAllowedDomainOrSignOut(User? user) async {
    final email = user?.email?.toLowerCase() ?? '';
    final valid = email.isNotEmpty && email.endsWith('@multitecua.com');

    if (!valid) {
      await _firebaseAuth.signOut();
      throw AuthDomainNotAllowedException();
    }
  }

  // Future<void> validateSession() async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) return;
  //   await _enforceAllowedDomainOrSignOut(user);
  // }

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
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Stream<String?> idTokenChanges() => _firebaseAuth.idTokenChanges().asyncMap(
    (u) async => u == null ? null : await u.getIdToken(),
  );

  // Helper to fetch a fresh ID token once
  Future<String?> getIdTokenOnce({bool forceRefresh = false}) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    return user.getIdToken(forceRefresh);
  }
}
