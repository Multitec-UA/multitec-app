import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sq1_assignment/network_service/network_service.dart';

class Square1ApiClient extends NetworkServiceClient {
  Square1ApiClient._internal(List<Interceptor> interceptors)
      : super(
          baseUrl: const String.fromEnvironment('SQUARE1_URL'),
          interceptors: interceptors,
        );

  // ==== ROUTE RESOURCES ======================================================
  late final CityResource cityResource = CityResource(httpClient);

  // ==== FACTORY METHODS ======================================================
  static Future<Square1ApiClient> create() async {
    return Square1ApiClient._internal(await _initializeInterceptors());
  }

  static Future<List<Interceptor>> _initializeInterceptors() async {
    final cacheOptions = CacheOptions(
      store: HiveCacheStore(await _getCacheDir()),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 10),
    );

    return <Interceptor>[
      DioCacheInterceptor(options: cacheOptions),
    ];
  }

  static Future<String> _getCacheDir() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  PaginationMeta paginationMetaFromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      totalResults: json['total'] as int,
    );
  }
}
