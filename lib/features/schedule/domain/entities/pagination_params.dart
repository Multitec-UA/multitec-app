import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_params.freezed.dart';

@freezed
abstract class PaginationParams with _$PaginationParams {
  const factory PaginationParams({String? cursor, @Default(20) int limit}) =
      _PaginationParams;
}
