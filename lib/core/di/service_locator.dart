import 'package:get_it/get_it.dart';
import 'package:multitec_app/core/network/network_service.dart';
import 'package:multitec_app/features/city_search/city_search.dart';

final locator = GetIt.instance;

Future<void> serviceLocatorSetUp() async {
  locator
    ..enableRegisteringMultipleInstancesOfOneType()
    ..registerSingletonAsync<NetworkServiceClient>(
      Square1ApiClient.create,
      instanceName: 'Square1ApiClient',
    )
    ..registerSingletonAsync<NetworkServiceClient>(
      GoogleMapsApiClient.create,
      instanceName: 'GoogleMapsApiClient',
    )
    ..registerSingletonAsync<NetworkServiceClient>(
      MultitecApiClient.create,
      instanceName: 'MultitecApiClient',
    )
    ..registerSingletonWithDependencies<CitySearchRepository>(
      () => ApiCitySearchRepository(
        square1Client: locator.get<NetworkServiceClient>(
          instanceName: 'Square1ApiClient',
        ) as Square1ApiClient,
        googleMapsApiClient: locator.get<NetworkServiceClient>(
          instanceName: 'GoogleMapsApiClient',
        ) as GoogleMapsApiClient,
      ),
      dependsOn: [
        InitDependency(
          NetworkServiceClient,
          instanceName: 'Square1ApiClient',
        ),
        InitDependency(
          NetworkServiceClient,
          instanceName: 'GoogleMapsApiClient',
        ),
      ],
    );

  await locator.allReady();
}

void serviceLocatorDispose() {
  locator.reset();
}
