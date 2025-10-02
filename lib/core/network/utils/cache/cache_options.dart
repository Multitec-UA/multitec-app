import 'package:multitec_app/core/network/utils/cache/cache.dart';

class CacheOptions {
  CacheOptions({
    required this.storeType,
    this.policy = CachePolicy.request,
    this.hitCacheOnErrorExcept,
    this.maxStale,
    this.priority = CachePriority.normal,
    this.cipher = false,
    this.encrypt,
    this.decrypt,
    this.allowPostMethod = false,
  }) : assert(
         !(cipher && (encrypt == null || decrypt == null)),
         'If cipher is enabled, both encrypt and decrypt functions must be provided',
       );

  final CacheStoreType storeType;
  final CachePolicy policy;
  final List<int>? hitCacheOnErrorExcept;
  final Duration? maxStale;
  final CachePriority priority;
  final bool cipher;
  final Future<List<int>> Function(List<int> bytes)? encrypt;
  final Future<List<int>> Function(List<int> bytes)? decrypt;
  final bool allowPostMethod;
}
