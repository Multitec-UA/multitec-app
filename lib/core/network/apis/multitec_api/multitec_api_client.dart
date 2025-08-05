import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:multitec_app/core/network/network_service.dart';

class MultitecApiClient extends NetworkServiceClient {
  MultitecApiClient._internal(List<Interceptor> interceptors)
      : super(
          baseUrl: const String.fromEnvironment('MULTITEC_API_URL'),
          interceptors: interceptors,
        );

  static Future<MultitecApiClient> create() async {
    return MultitecApiClient._internal(await _initializeInterceptors());
  }

  // ==== FACTORY METHODS ======================================================
  static Future<List<Interceptor>> _initializeInterceptors() async {
    final cacheOptions = CacheOptions(
      store: HiveCacheStore(await NetworkServiceClient.getCacheDir()),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 10),
    );

    return [
      DioCacheInterceptor(options: cacheOptions),
    ];
  }

  String exampleMethod() {
    return 'Example method';
  }
}
