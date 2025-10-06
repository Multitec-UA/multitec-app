import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_params.freezed.dart';

@freezed
abstract class PaginationParams with _$PaginationParams {
  const factory PaginationParams({
    String? cursor,
    @Default(PaginationParams.defaultLimit) int limit,
  }) = _PaginationParams;

  static const int defaultLimit = 20;
}
