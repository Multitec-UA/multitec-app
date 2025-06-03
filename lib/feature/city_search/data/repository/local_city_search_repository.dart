import 'package:multiple_result/multiple_result.dart';
import 'package:sq1_assignment/feature/city_search/city_search.dart';
import 'package:sq1_assignment/network_service/network_service.dart';

class LocalCitySearchRepository implements CitySearchRepository {
  LocalCitySearchRepository();

  @override
  Future<Result<PaginatedData<City>, String>> getCitiesByName({
    required String name,
    int? page,
  }) async {
    try {
      return Success(PaginatedData<City>.empty());
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<Result<Location, String>> getCityLocation(City city) async {
    try {
      return const Success(Location(latitude: 0, longitude: 0));
    } catch (e) {
      return Error(e.toString());
    }
  }
}
