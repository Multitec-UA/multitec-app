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
    ..enableRegisteringMultipleInstancesOfOneType()
    ..registerSingletonAsync<NetworkService>(
      Square1ApiClient.create,
      instanceName: 'Square1Api',
    )
    ..registerSingletonAsync<NetworkService>(
      GoogleMapsApiClient.create,
      instanceName: 'GoogleMapsApi',
    )
    ..registerSingletonAsync<NetworkService>(
      MultitecApiClient.create,
      instanceName: 'MultitecApi',
    )
    ..registerSingletonWithDependencies<CitySearchRepository>(
      () => ApiCitySearchRepository(
        square1Api:
            locator<NetworkService>(instanceName: 'Square1Api') as Square1Api,
        googleMapsApi: locator<NetworkService>(instanceName: 'GoogleMapsApi')
            as GoogleMapsApi,
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
            locator<NetworkService>(instanceName: 'MultitecApi'),
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
