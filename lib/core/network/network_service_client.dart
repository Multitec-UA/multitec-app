import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:multitec_app/core/network/network_service.dart';
import 'package:path_provider/path_provider.dart';

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
      ..receiveTimeout = receiveTimeout ?? const Duration(seconds: 12)
      ..contentType = 'application/json';

    // Attach any interceptors
    if (interceptors != null) {
      httpClient.interceptors.addAll(interceptors);
    }
  }

  final Dio httpClient;

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await httpClient.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data as T;
  }

  Future<T> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await httpClient.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data as T;
  }

  // ==== Common Method to Get Cache Directory ===============================
  static Future<String> getCacheDir() async {
    if (kIsWeb) return '/tmp';
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // ==== Optional Method to Parse Pagination Meta ===========================
  // Default implementation - subclasses can override this if needed
  PaginationMeta paginationMetaFromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      totalResults: json['total'] as int,
    );
  }
}
