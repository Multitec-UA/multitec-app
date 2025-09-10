import 'package:get_it/get_it.dart';
import 'package:multitec_app/core/local_storage/local_storage.dart';
import 'package:multitec_app/core/local_storage/shared_preferences.dart';
import 'package:multitec_app/core/network/network.dart';
import 'package:multitec_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:multitec_app/features/auth/data/datasources/mock_auth_datasource.dart';
import 'package:multitec_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:multitec_app/features/city_search/city_search.dart';
import 'package:multitec_app/features/example/data/datasources/example_local_datasource.dart';
import 'package:multitec_app/features/example/data/datasources/example_mock_datasource.dart';
import 'package:multitec_app/features/example/data/datasources/example_remote_datasource.dart';
import 'package:multitec_app/features/example/data/repositories/example_repository_impl.dart';
import 'package:multitec_app/features/example/domain/repositories/example_repository.dart';
import 'package:multitec_app/features/example/domain/usecases/fetch_example_items_usecase.dart';
import 'package:multitec_app/features/example/domain/usecases/send_report_usecase.dart';
import 'package:multitec_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_mock_datasource.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:multitec_app/features/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/join_item_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/leave_item_usecase.dart';
import 'package:multitec_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';

final locator = GetIt.instance;
const useMocks = false;

Future<void> serviceLocatorSetUp() async {
  locator.registerLazySingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );

  locator.registerLazySingletonAsync<LocalStorageService>(
    () async => SharedPreferencesService(
      preferences: await locator.getAsync<SharedPreferences>(),
    ),
  );

  locator
    ..enableRegisteringMultipleInstancesOfOneType()
    ..registerSingletonAsync<Square1Api>(
      Square1ApiClient.create,
    )
    ..registerSingletonAsync<GoogleMapsApi>(
      GoogleMapsApiClient.create,
    )
    ..registerSingletonAsync<NetworkService>(
      MultitecApiClient.create,
      instanceName: 'MultitecApi',
    )
    ..registerSingletonWithDependencies<CitySearchRepository>(
      () => ApiCitySearchRepository(
        square1Api: locator<Square1Api>(),
        googleMapsApi: locator<GoogleMapsApi>(),
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

  /// Auth Feature
  // Datasources
  locator.registerFactory<FirebaseAuthDataSource>(
    () => useMocks ? MockAuthDataSource() : FirebaseAuthDataSource(),
  );

  // Repository
  locator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      locator<FirebaseAuthDataSource>(),
    ),
  );

  // Services
  locator.registerLazySingleton<AuthService>(
    () => AuthService(
      locator<FirebaseAuthDataSource>(),
    ),
  );

  // UseCases
  locator.registerFactory(
    () => SignInWithGoogleUseCase(
      locator<AuthRepository>(),
    ),
  );

  locator.registerFactory(
    () => SignOutUseCase(
      locator<AuthRepository>(),
    ),
  );

  /// User Feature

  // Repository
  locator.registerFactory<UserRepository>(
    () => UserRepositoryImpl(locator<FirebaseAuthDataSource>()),
  );

  // Cubits
  locator.registerLazySingleton<UserCubit>(
    () => UserCubit(
      locator<UserRepository>(),
      locator<AuthService>(),
    ),
  );

  locator.registerFactory(
    () => ProfileCubit(
      locator<SignOutUseCase>(),
    ),
  );

  /// Schedule Feature
  // Datasources
  locator.registerFactory<ScheduleRemoteDataSource>(
    () => useMocks ? ScheduleMockDataSource() : ScheduleRemoteDataSourceImpl(),
  );

  // Repository
  locator.registerFactory<ScheduleRepository>(
    () => ScheduleRepositoryImpl(locator<ScheduleRemoteDataSource>()),
  );

  // Event Bus
  locator.registerLazySingleton<EventBus>(EventBusImpl.new);

  // UseCases
  locator.registerFactory(() => GetScheduleItemsUseCase(locator()));
  locator.registerFactory(() => JoinItemUseCase(locator(), locator()));
  locator.registerFactory(() => LeaveItemUseCase(locator(), locator()));
  locator.registerFactory(() => IsJoinedUseCase(locator()));

  await locator.allReady();
}

void serviceLocatorDispose() {
  locator.reset();
}
