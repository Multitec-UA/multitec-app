import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  const ApiKeyInterceptor(this.apiKey);

  final String apiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['key'] = apiKey;
    super.onRequest(options, handler);
  }
}
