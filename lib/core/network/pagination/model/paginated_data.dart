import 'package:sq1_assignment/core/network/network_service.dart';

class PaginatedData<T> {
  const PaginatedData({
    required this.items,
    required this.meta,
  });

  factory PaginatedData.fromJson({
    required Map<String, dynamic> items,
    required Map<String, dynamic> meta,
    required T Function(Map<String, dynamic>) fromJson,
    required PaginationMeta Function(Map<String, dynamic>) metaFromJson,
  }) {
    return PaginatedData(
      items: (items as List)
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: metaFromJson(meta),
    );
  }

  factory PaginatedData.empty() =>
      const PaginatedData(items: [], meta: PaginationMeta());

  final List<T> items;
  final PaginationMeta meta;

  PaginatedData<T> copyWith({
    List<T>? items,
    PaginationMeta? meta,
  }) {
    return PaginatedData(
      items: items ?? this.items,
      meta: meta ?? this.meta,
    );
  }
}
