import 'package:multitec_app/features/user/domain/models/user.dart';

class AuthResult {
  const AuthResult({required this.user, required this.token});
  final User user;
  final String token;
}
