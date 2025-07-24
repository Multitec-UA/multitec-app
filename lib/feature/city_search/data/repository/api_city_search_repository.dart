import 'package:multiple_result/multiple_result.dart';
import 'package:sq1_assignment/core/network/network_service.dart';
import 'package:sq1_assignment/feature/city_search/city_search.dart';

class ApiCitySearchRepository implements CitySearchRepository {
  ApiCitySearchRepository({
    required Square1ApiClient square1Client,
    required GoogleMapsApiClient googleMapsApiClient,
  })  : _square1Client = square1Client,
        _googleMapsApiClient = googleMapsApiClient;

  final Square1ApiClient _square1Client;
  final GoogleMapsApiClient _googleMapsApiClient;

  CityResource get _cityResource => _square1Client.cityResource;
  GeocodeResource get _geocodeResource => _googleMapsApiClient.geocodeResource;

  @override
  Future<Result<PaginatedData<City>, String>> getCitiesByName({
    required String name,
    int? page,
  }) async {
    try {
      final response = await _cityResource.getCities<Map<String, dynamic>>(
        name: name,
        page: page,
        include: 'country',
      );

      final dataContent = response.data!['data'] as Map<String, dynamic>;

      final cities = (dataContent['items'] as List)
          .map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList();

      final paginationMeta = _square1Client.paginationMetaFromJson(
        dataContent['pagination'] as Map<String, dynamic>,
      );

      final citiesWithLocation = await _addLocationsToCities(cities);

      final paginatedCitiesWithLocation = PaginatedData(
        items: citiesWithLocation,
        meta: paginationMeta,
      );

      return Success(paginatedCitiesWithLocation);
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<List<City>> _addLocationsToCities(List<City> cities) async {
    final futures = cities.map(getCityLocation).toList();
    final locationResults = await Future.wait(futures);

    final citiesWithLocation = <City>[];
    for (var i = 0; i < cities.length; i++) {
      locationResults[i].when(
        (location) => citiesWithLocation.add(
          cities[i].copyWith(location: location),
        ),
        (error) => citiesWithLocation.add(cities[i]),
      );
    }
    return citiesWithLocation;
  }

  @override
  Future<Result<Location, String>> getCityLocation(City city) async {
    try {
      final response = await _geocodeResource
          .getCoordinatesFromAddress<Map<String, dynamic>>(
        address: '${city.name}, ${city.country.name}',
      );

      final results = response.data!['results'] as List<dynamic>;
      final firstResult = results.first as Map<String, dynamic>;
      final geometry = firstResult['geometry'] as Map<String, dynamic>;
      final location =
          Location.fromJson(geometry['location'] as Map<String, dynamic>);

      return Success(location);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
