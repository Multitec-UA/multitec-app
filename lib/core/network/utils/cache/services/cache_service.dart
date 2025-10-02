import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:multitec_app/core/network/utils/cache/cache.dart';
import 'package:path_provider/path_provider.dart';

abstract class CacheService {
  // ==== Common Method to Get Cache Directory ===============================
  static Future<String> getCacheDir() async {
    if (kIsWeb) {
      return '';
    }
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<Interceptor> buildCacheInterceptor({required CacheOptions options});
}
