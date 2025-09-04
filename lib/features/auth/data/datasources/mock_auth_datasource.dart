import 'dart:async';
import 'package:multitec_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:multitec_app/features/auth/data/dtos/auth_dto.dart';

class MockAuthDataSource implements AuthRemoteDataSource {
  MockAuthDataSource();

  @override
  Future<AuthDTO> signInWithGoogle() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    const user = AuthDTO(
      id: 'mock_user_123',
      token: 'token_123',
      name: 'Usuario Mock',
      email: 'mock@example.com',
      photoUrl: 'https://via.placeholder.com/150',
    );

    return user;
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
