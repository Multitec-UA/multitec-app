class PaginationMeta {
  const PaginationMeta({
    this.totalResults = 0,
    this.lastPage = 1,
    this.perPage = 20,
    this.currentPage = 1,
  });

  final int totalResults;
  final int lastPage;
  final int perPage;
  final int currentPage;

  bool get hasNextPage => currentPage < lastPage;

  PaginationMeta copyWith({
    int? totalResults,
    int? lastPage,
    int? perPage,
    int? currentPage,
  }) {
    return PaginationMeta(
      totalResults: totalResults ?? this.totalResults,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
