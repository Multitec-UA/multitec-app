import 'package:dio/dio.dart';

abstract class NetworkServiceClient {
  NetworkServiceClient({
    required String baseUrl,
    Duration? sendTimeout,
    Duration? receiveTimeout,
    List<Interceptor>? interceptors,
  }) : httpClient = Dio() {
    // Configure Dio options
    httpClient.options
      ..baseUrl = baseUrl
      ..sendTimeout = sendTimeout ?? const Duration(seconds: 12)
      ..receiveTimeout = receiveTimeout ?? const Duration(seconds: 12);

    // Attach any interceptors
    if (interceptors != null) {
      httpClient.interceptors.addAll(interceptors);
    }
  }

  final Dio httpClient;
}
