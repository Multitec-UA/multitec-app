import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:multitec_app/core/network/network_service.dart';

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
      store: HiveCacheStore(await NetworkServiceClient.getCacheDir()),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 10),
    );

    return <Interceptor>[
      DioCacheInterceptor(options: cacheOptions),
    ];
  }
}
