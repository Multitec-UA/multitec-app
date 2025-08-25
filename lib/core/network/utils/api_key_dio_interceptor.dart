import 'package:dio/dio.dart';

class ApiKeyDioInterceptor extends Interceptor {
  const ApiKeyDioInterceptor(this.apiKey);

  final String apiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['key'] = apiKey;
    super.onRequest(options, handler);
  }
}
