import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as dio_cache;
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:multitec_app/core/network/network.dart';

class DioCacheInterceptorService implements CacheService {
  @override
  Future<Interceptor> buildCacheInterceptor({
    required CacheOptions options,
  }) async {
    return dio_cache.DioCacheInterceptor(
      options: dio_cache.CacheOptions(
        store: await getStoreFromStoreType(options.storeType),
        allowPostMethod: options.allowPostMethod,
        cipher: options.cipher
            ? dio_cache.CacheCipher(
                decrypt: options.decrypt!,
                encrypt: options.encrypt!,
              )
            : null,
        hitCacheOnErrorExcept: options.hitCacheOnErrorExcept,
        maxStale: options.maxStale,
        policy: transformPolicy(options.policy),
        priority: transformPriority(options.priority),
      ),
    );
  }

  Future<dio_cache.CacheStore> getStoreFromStoreType(
    CacheStoreType type,
  ) async {
    switch (type) {
      case CacheStoreType.hive:
        if (kIsWeb) {
          return dio_cache.MemCacheStore();
        }
        return HiveCacheStore(await CacheService.getCacheDir());
      case CacheStoreType.memory:
        return dio_cache.MemCacheStore();
    }
  }

  dio_cache.CachePolicy transformPolicy(CachePolicy policy) {
    switch (policy) {
      case CachePolicy.forceCache:
        return dio_cache.CachePolicy.forceCache;
      case CachePolicy.refreshForceCache:
        return dio_cache.CachePolicy.refreshForceCache;
      case CachePolicy.noCache:
        return dio_cache.CachePolicy.noCache;
      case CachePolicy.refresh:
        return dio_cache.CachePolicy.refresh;
      case CachePolicy.request:
        return dio_cache.CachePolicy.request;
    }
  }

  dio_cache.CachePriority transformPriority(CachePriority priority) {
    switch (priority) {
      case CachePriority.low:
        return dio_cache.CachePriority.low;
      case CachePriority.normal:
        return dio_cache.CachePriority.normal;
      case CachePriority.high:
        return dio_cache.CachePriority.high;
    }
  }
}
