import 'package:get_it/get_it.dart';
import 'package:multitec_app/core/network/network_service.dart';
import 'package:multitec_app/features/city_search/city_search.dart';

final locator = GetIt.instance;

Future<void> serviceLocatorSetUp() async {
  locator
    ..registerSingletonAsync<Square1ApiClient>(Square1ApiClient.create)
    ..registerSingletonAsync<GoogleMapsApiClient>(GoogleMapsApiClient.create)
    ..registerSingletonAsync<MultitecApiClient>(MultitecApiClient.create)
    ..registerSingletonWithDependencies<CitySearchRepository>(
      () => ApiCitySearchRepository(
        square1Client: locator<Square1ApiClient>(),
        googleMapsApiClient: locator<GoogleMapsApiClient>(),
      ),
      dependsOn: [Square1ApiClient, GoogleMapsApiClient],
    );

  await locator.allReady();
}

void serviceLocatorDispose() {
  locator.reset();
}
