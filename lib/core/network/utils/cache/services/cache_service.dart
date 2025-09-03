import 'package:dio/dio.dart';
import 'package:multitec_app/core/network/network.dart';
import 'package:path_provider/path_provider.dart';

abstract class CacheService {
  // ==== Common Method to Get Cache Directory ===============================
  static Future<String> getCacheDir() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<Interceptor> buildCacheInterceptor({required CacheOptions options});
}
