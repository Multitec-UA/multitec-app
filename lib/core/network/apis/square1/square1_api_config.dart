import 'package:dio/dio.dart';
import 'package:multitec_app/core/constants/constants.dart';
import 'package:multitec_app/core/network/network.dart';

class Square1ApiConfig {
  static const String baseUrl = Environment.square1Url;

  static const Duration timeout = Duration(seconds: 12);

  static Future<List<Interceptor>> getInterceptors() async => [
        await _getCacheInterceptor(),
      ];

  static final CacheOptions _cacheOptions = CacheOptions(
    storeType: CacheStoreType.isar,
    policy: CachePolicy.forceCache,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(days: 10),
  );

  static Future<Interceptor> _getCacheInterceptor() async {
    return DioCacheInterceptorService()
        .buildCacheInterceptor(options: _cacheOptions);
  }
}
