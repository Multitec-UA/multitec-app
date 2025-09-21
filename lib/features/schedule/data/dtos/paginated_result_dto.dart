import 'package:multitec_app/features/schedule/domain/entities/paginated_result.dart';

//TODO: Convertir a freezed?
class PaginatedResultDto<T> {
  const PaginatedResultDto({
    required this.items,
    required this.hasMore,
    this.nextCursor,
    this.totalCount,
  });

  factory PaginatedResultDto.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) itemFromMap,
  ) {
    return PaginatedResultDto<T>(
      items: (map['items'] as List<dynamic>)
          .map((item) => itemFromMap(item as Map<String, dynamic>))
          .toList(),
      nextCursor: map['nextCursor'] as String?,
      hasMore: map['hasMore'] as bool,
      totalCount: map['totalCount'] as int?,
    );
  }

  final List<T> items;
  final String? nextCursor;
  final bool hasMore;
  final int? totalCount;

  Map<String, dynamic> toMap(Map<String, dynamic> Function(T) itemToMap) {
    return {
      'items': items.map(itemToMap).toList(),
      'nextCursor': nextCursor,
      'hasMore': hasMore,
      'totalCount': totalCount,
    };
  }

  PaginatedResult<R> toDomain<R>(R Function(T) itemToDomain) {
    return PaginatedResult<R>(
      items: items.map(itemToDomain).toList(),
      nextCursor: nextCursor,
      hasMore: hasMore,
      totalCount: totalCount,
    );
  }
}
