import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sq1_assignment/core/network/multitec_api/multitec_api.dart';
import 'package:sq1_assignment/core/network/network_service_client.dart';

class MultitecApiClient extends NetworkServiceClient implements MultitecApi {
  MultitecApiClient._internal(List<Interceptor> interceptors)
      : super(
          baseUrl: const String.fromEnvironment('MULTITEC_API_URL'),
          interceptors: interceptors,
        );

  static Future<MultitecApiClient> create() async {
    return MultitecApiClient._internal(await _initializeInterceptors());
  }

  static Future<List<Interceptor>> _initializeInterceptors() async {
    final cacheOptions = CacheOptions(
      store: HiveCacheStore(await _getCacheDir()),
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 10),
    );

    return [
      DioCacheInterceptor(options: cacheOptions),
    ];
  }

  static Future<String> _getCacheDir() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  @override
  String exampleMethod() {
    return 'Example method';
  }
}
