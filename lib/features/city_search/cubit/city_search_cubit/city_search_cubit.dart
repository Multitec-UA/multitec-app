import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/network/network_service.dart';
import 'package:multitec_app/features/city_search/city_search.dart';

part 'city_search_cubit.freezed.dart';
part 'city_search_state.dart';

class CitySearchCubit extends Cubit<CitySearchState> {
  CitySearchCubit({
    required CitySearchRepository repository,
  })  : _repository = repository,
        super(const CitySearchState(status: CitySearchStatus.initial));

  final CitySearchRepository _repository;

  void newCitySearch(String query) {
    if (query == state.query || query.isEmpty) return;
    emit(const CitySearchState(status: CitySearchStatus.initial));
    searchCitiesByName(query: query);
  }

  void getCitiesNextPage() {
    if (!state.meta.hasNextPage) return;
    if (state.status.isLoading) return;
    searchCitiesByName(
      query: state.query,
      page: state.meta.currentPage + 1,
    );
  }

  Future<void> searchCitiesByName({
    required String query,
    int page = 1,
  }) async {
    emit(
      state.copyWith(
        status: CitySearchStatus.loading,
        query: query,
      ),
    );

    final result = await _repository.getCitiesByName(
      name: query,
      page: page,
    );
    result.when(
      (paginatedCities) => emit(
        state.copyWith(
          status: CitySearchStatus.success,
          cities: [...state.cities, ...paginatedCities.items],
          meta: paginatedCities.meta,
          query: query,
        ),
      ),
      (error) => emit(
        state.copyWith(
          status: CitySearchStatus.failure,
          message: error,
        ),
      ),
    );
  }

  Location? getFirstLocation() {
    final firstCityWithLocation =
        state.cities.firstWhereOrNull((element) => element.location != null);
    return firstCityWithLocation?.location;
  }
}
