import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:multitec_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:multitec_app/features/user/data/dtos/user_dto.dart';

class MockAuthDataSource implements FirebaseAuthDataSource {
  MockAuthDataSource();

  @override
  Future<void> signInWithGoogle() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> consumeRedirectIfPresent() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> validateSession() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  UserDTO? getCurrentUser() {
    return const UserDTO(
      id: 'mock_user_123',
      name: 'Usuario Mock',
      email: 'mock@example.com',
      photoUrl: 'https://via.placeholder.com/150',
    );
  }

  @override
  Stream<firebase_auth.User?> authStateChanges() {
    // Simulate an authenticated user once
    return Stream<firebase_auth.User?>.value(null);
  }

  @override
  Stream<String?> idTokenChanges() {
    // Emit a mock token once
    return Stream<String?>.value('mock-id-token');
  }

  @override
  Future<String?> getIdTokenOnce({bool forceRefresh = false}) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    return 'mock-id-token';
  }
}
