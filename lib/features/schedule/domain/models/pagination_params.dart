import 'package:flutter/foundation.dart';

@immutable
class PaginationParams {
  const PaginationParams({
    this.cursor,
    int? limit,
  }) : limit = limit ?? defaultLimit;

  static const int defaultLimit = 20;

  final String? cursor;
  final int limit;

  PaginationParams copyWith({
    String? cursor,
    int? limit,
  }) {
    return PaginationParams(
      cursor: cursor ?? this.cursor,
      limit: limit ?? this.limit,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaginationParams &&
        other.cursor == cursor &&
        other.limit == limit;
  }

  @override
  int get hashCode => Object.hash(cursor, limit);

  @override
  String toString() => 'PaginationParams(cursor: $cursor, limit: $limit)';
}
