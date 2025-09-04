import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:multitec_app/features/user/domain/models/user.dart';

class AuthDTO {
  const AuthDTO({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  factory AuthDTO.fromFirebaseUser(UserCredential firebaseUser) {
    final id = firebaseUser.user?.uid ?? '';
    final token = firebaseUser.credential?.accessToken ?? '';
    final email = firebaseUser.user?.email ?? '';
    final name = firebaseUser.user?.displayName ?? '';
    final photoUrl = firebaseUser.user?.photoURL ?? '';

    return AuthDTO(
      id: id,
      token: token,
      email: email,
      name: name,
      photoUrl: photoUrl,
    );
  }

  final String id;
  final String token;
  final String name;
  final String email;
  final String? photoUrl;

  User toDomain() => User(
        id: id,
        name: name,
        email: email,
        photoUrl: photoUrl,
      );
}
