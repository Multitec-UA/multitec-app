import 'package:get_it/get_it.dart';
import 'package:multitec_app/core/network/network.dart';
import 'package:multitec_app/features/city_search/city_search.dart';
import 'package:multitec_app/features/example/data/datasources/example_local_datasource.dart';
import 'package:multitec_app/features/example/data/datasources/example_mock_datasource.dart';
import 'package:multitec_app/features/example/data/datasources/example_remote_datasource.dart';
import 'package:multitec_app/features/example/data/repositories/example_repository_impl.dart';
import 'package:multitec_app/features/example/domain/repositories/example_repository.dart';
import 'package:multitec_app/features/example/domain/usecases/fetch_example_items_usecase.dart';
import 'package:multitec_app/features/example/domain/usecases/send_report_usecase.dart';

final locator = GetIt.instance;
const useMocks = true;

Future<void> serviceLocatorSetUp() async {
  //TODO: Alternativa a useMocks
  //const useMocks = bool.fromEnvironment('USE_MOCK_DS', defaultValue: false);

  locator
    ..registerSingletonAsync<Square1Api>(
      () async => Square1ApiClient(
        HttpClient(
          baseUrl: Square1ApiConfig.baseUrl,
          timeout: Square1ApiConfig.timeout,
          interceptors: await Square1ApiConfig.getInterceptors(),
        ),
      ),
    )
    ..registerSingletonAsync<GoogleMapsApi>(
      () async => GoogleMapsApiClient(
        HttpClient(
          baseUrl: GoogleMapsApiConfig.baseUrl,
          timeout: GoogleMapsApiConfig.timeout,
          interceptors: await GoogleMapsApiConfig.getInterceptors(),
        ),
      ),
    )
    ..registerSingletonAsync<HttpClient>(
      MultitecApiClient.create,
      instanceName: 'multitecApi',
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

  /// Example Feature
  // Datasources
  locator.registerFactory<ExampleRemoteDataSource>(
    () => useMocks
        ? ExampleMockDataSource()
        : ExampleRemoteDataSourceImpl(
            locator<HttpClient>(instanceName: 'multitecApi'),
          ),
  );

  locator.registerFactory<ExampleLocalDataSource>(
    ExampleLocalDataSourceImpl.new,
  );

  // Repository
  locator.registerFactory<ExampleRepository>(
    () => ExampleRepositoryImpl(locator<ExampleRemoteDataSource>()),
  );

  // UseCases
  locator.registerFactory(() => FetchExampleItemsUseCase(locator()));
  locator.registerFactory(() => SendReportUseCase(locator()));

  await locator.allReady();
}

void serviceLocatorDispose() {
  locator.reset();
}
