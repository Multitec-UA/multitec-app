import 'package:multitec_app/features/auth/data/dtos/auth_dto.dart';

abstract class AuthRemoteDataSource {
  Future<AuthDTO> signInWithGoogle();
  Future<void> signOut();
}
