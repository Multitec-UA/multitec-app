part of 'city_search_cubit.dart';

enum CitySearchStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == CitySearchStatus.initial;
  bool get isLoading => this == CitySearchStatus.loading;
  bool get isSuccess => this == CitySearchStatus.success;
  bool get isFailure => this == CitySearchStatus.failure;
}

@freezed
class CitySearchState with _$CitySearchState {
  const factory CitySearchState({
    required CitySearchStatus status,
    @Default([]) List<City> cities,
    @Default(PaginationMeta()) PaginationMeta meta,
    @Default('') String query,
    String? message,
  }) = _CitySearchState;
}
