class PaginatedResult<T> {
  const PaginatedResult({
    required this.items,
    required this.hasMore,
    this.nextCursor,
    this.totalCount,
  });

  final List<T> items;
  final String? nextCursor;
  final bool hasMore;
  final int? totalCount;

  PaginatedResult<T> copyWith({
    List<T>? items,
    String? nextCursor,
    bool? hasMore,
    int? totalCount,
  }) {
    return PaginatedResult<T>(
      items: items ?? this.items,
      nextCursor: nextCursor ?? this.nextCursor,
      hasMore: hasMore ?? this.hasMore,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaginatedResult<T> &&
        other.items == items &&
        other.nextCursor == nextCursor &&
        other.hasMore == hasMore &&
        other.totalCount == totalCount;
  }

  @override
  int get hashCode => Object.hash(items, nextCursor, hasMore, totalCount);

  @override
  String toString() =>
      'PaginatedResult(items: ${items.length}, nextCursor: $nextCursor, hasMore: $hasMore, totalCount: $totalCount)';
}
