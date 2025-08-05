import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/network/network_service.dart';
import 'package:multitec_app/features/city_search/city_search.dart';

abstract class CitySearchRepository {
  Future<Result<PaginatedData<City>, String>> getCitiesByName({
    required String name,
    int? page,
  });
  Future<Result<Location, String>> getCityLocation(City city);
}
