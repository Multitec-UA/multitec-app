import 'package:dio/dio.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authService);
  final AuthService _authService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _authService.token;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
