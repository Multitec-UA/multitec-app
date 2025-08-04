import 'package:get_it/get_it.dart';
import 'package:sq1_assignment/core/network/multitec_api/multitec_api.dart';
import 'package:sq1_assignment/core/network/multitec_api/multitec_api_client.dart';
import 'package:sq1_assignment/core/network/network_service.dart';
import 'package:sq1_assignment/features/city_search/city_search.dart';

final locator = GetIt.instance;

Future<void> serviceLocatorSetUp() async {
  locator
    ..registerSingletonAsync<Square1ApiClient>(Square1ApiClient.create)
    ..registerSingletonAsync<GoogleMapsApiClient>(GoogleMapsApiClient.create)
    ..registerSingletonWithDependencies<CitySearchRepository>(
      () => ApiCitySearchRepository(
        square1Client: locator<Square1ApiClient>(),
        googleMapsApiClient: locator<GoogleMapsApiClient>(),
      ),
      dependsOn: [Square1ApiClient, GoogleMapsApiClient],
    );

  locator.registerSingletonAsync<MultitecApi>(
    MultitecApiClient.create,
  );

  await locator.allReady();
}

void serviceLocatorDispose() {
  locator.reset();
}
