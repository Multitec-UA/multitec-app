import 'package:dio/dio.dart';
import 'package:multitec_app/core/network/network.dart';

class Square1ApiClient extends NetworkService implements Square1Api {
  Square1ApiClient._({
    super.interceptors,
  }) : super(
          baseUrl: Square1ApiConfig.baseUrl,
          timeout: Square1ApiConfig.timeout,
        );

  static Future<Square1ApiClient> create() async {
    final interceptors = await Square1ApiConfig.getInterceptors();
    return Square1ApiClient._(interceptors: interceptors);
  }

  static const String _city = '/city';

  @override
  Future<Response<T>> getCities<T>({
    String? name,
    String? include,
    int? page,
  }) async {
    return get<T>(
      _city,
      queryParameters: {
        'filter[0][name][contains]': name,
        'include': include,
        'page': page,
      },
    );
  }

  @override
  PaginationMeta paginationMetaFromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      totalResults: json['total'] as int,
    );
  }
}
