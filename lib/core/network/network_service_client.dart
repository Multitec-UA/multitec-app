import 'package:dio/dio.dart';
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
      ..receiveTimeout = receiveTimeout ?? const Duration(seconds: 12);

    // Attach any interceptors
    if (interceptors != null) {
      httpClient.interceptors.addAll(interceptors);
    }
  }

  final Dio httpClient;

  // ==== Common Method to Get Cache Directory ===============================
  static Future<String> getCacheDir() async {
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
