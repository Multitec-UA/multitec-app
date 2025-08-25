import 'package:get_it/get_it.dart';
import 'package:multitec_app/core/network/network.dart';
import 'package:multitec_app/features/city_search/city_search.dart';

final locator = GetIt.instance;

Future<void> serviceLocatorSetUp() async {
  locator
    ..registerSingletonAsync<Square1Api>(
      () async => Square1ApiClient(
        DioClient(
          baseUrl: Square1ApiConfig.baseUrl,
          timeout: Square1ApiConfig.timeout,
          interceptors: await Square1ApiConfig.getInterceptors(),
        ),
      ),
    )
    ..registerSingletonAsync<GoogleMapsApi>(
      () async => GoogleMapsApiClient(
        DioClient(
          baseUrl: GoogleMapsApiConfig.baseUrl,
          timeout: GoogleMapsApiConfig.timeout,
          interceptors: await GoogleMapsApiConfig.getInterceptors(),
        ),
      ),
    )
    ..registerSingletonAsync<MultitecApi>(
      () async => MultitecApiClient(
        DioClient(
          baseUrl: MultitecApiConfig.baseUrl,
          timeout: MultitecApiConfig.timeout,
          interceptors: await MultitecApiConfig.getInterceptors(),
        ),
      ),
    )
    ..registerSingletonWithDependencies<CitySearchRepository>(
      () => ApiCitySearchRepository(
        square1Api: locator.get<Square1Api>(),
        googleMapsApi: locator.get<GoogleMapsApi>(),
      ),
      dependsOn: [
        Square1Api,
        GoogleMapsApi,
      ],
    );
}

void serviceLocatorDispose() {
  locator.reset();
}
