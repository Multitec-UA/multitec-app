import 'package:multiple_result/multiple_result.dart';
import 'package:sq1_assignment/core/network/network_service.dart';
import 'package:sq1_assignment/features/city_search/city_search.dart';

abstract class CitySearchRepository {
  Future<Result<PaginatedData<City>, String>> getCitiesByName({
    required String name,
    int? page,
  });
  Future<Result<Location, String>> getCityLocation(City city);
}
