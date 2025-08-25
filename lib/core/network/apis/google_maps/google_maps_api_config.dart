import 'package:dio/dio.dart';
import 'package:multitec_app/core/network/network.dart';

class GoogleMapsApiConfig {
  static const String baseUrl = String.fromEnvironment('GOOGLE_MAPS_URL');

  static const Duration timeout = Duration(seconds: 12);

  static Future<List<Interceptor>> getInterceptors() async => [
        await _getCacheInterceptor(),
        _getApiKeyInterceptor(),
      ];

  static final CacheOptions _cacheOptions = CacheOptions(
    storeType: CacheStoreType.hive,
    policy: CachePolicy.forceCache,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(days: 10),
  );

  static Future<Interceptor> _getCacheInterceptor() async {
    return DioCacheInterceptorService()
        .buildCacheInterceptor(options: _cacheOptions);
  }

  static Interceptor _getApiKeyInterceptor() {
    return const ApiKeyDioInterceptor(
      String.fromEnvironment('GOOGLE_MAPS_API_KEY'),
    );
  }
}
