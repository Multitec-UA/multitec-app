import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sq1_assignment/core/network/network_service.dart';

class GoogleMapsApiClient extends NetworkServiceClient {
  GoogleMapsApiClient._internal(List<Interceptor> interceptors)
      : super(
          baseUrl: const String.fromEnvironment('GOOGLE_MAPS_URL'),
          interceptors: interceptors,
        );

  // ==== ROUTE RESOURCES ======================================================
  late final GeocodeResource geocodeResource = GeocodeResource(httpClient);

  // ==== FACTORY METHODS ======================================================
  static Future<GoogleMapsApiClient> create() async {
    return GoogleMapsApiClient._internal(await _initializeInterceptors());
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
      const ApiKeyInterceptor(String.fromEnvironment('GOOGLE_MAPS_API_KEY')),
    ];
  }

  static Future<String> _getCacheDir() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
}
