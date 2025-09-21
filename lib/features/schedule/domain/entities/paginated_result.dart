import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_result.freezed.dart';

@freezed
abstract class PaginatedResult<T> with _$PaginatedResult<T> {
  const factory PaginatedResult({
    required List<T> items,
    required bool hasMore,
    String? nextCursor,
    int? totalCount,
  }) = _PaginatedResult<T>;
}
