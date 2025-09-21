import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get_it/get_it.dart';
import 'package:multitec_app/core/database/local_database.dart';
import 'package:multitec_app/core/database/openers/sembast_io_opener.dart';
import 'package:multitec_app/core/database/openers/sembast_web_opener.dart';
import 'package:multitec_app/core/database/sembast_database.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/network/network.dart';
import 'package:multitec_app/core/preferences/local_storage.dart';
import 'package:multitec_app/core/preferences/shared_preferences.dart';
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
import 'package:multitec_app/features/schedule/data/datasources/schedule_local_datasource.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_mock_datasource.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:multitec_app/features/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_joined_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_latest_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_bytype_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_schedule_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/joined_schedules_cubit.dart';
import 'package:multitec_app/features/settings/data/datasources/settings_local_datasource.dart';
import 'package:multitec_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:multitec_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:multitec_app/features/settings/presentation/cubits/locale_cubit.dart';
import 'package:multitec_app/features/settings/presentation/cubits/theme_cubit.dart';
import 'package:multitec_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;
const useMocks = false;

Future<void> serviceLocatorSetUp() async {
  /// Preferences ///
  locator.registerSingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );
  locator.registerSingletonAsync<LocalStorageService>(
    () async => SharedPreferencesService(
      preferences: await locator.getAsync<SharedPreferences>(),
    ),
  );

  /// Local database ///
  if (kIsWeb) {
    locator.registerLazySingleton<LocalDatabase>(
      () => SembastDatabase(opener: SembastWebOpener()),
    );
  } else {
    locator.registerLazySingleton<LocalDatabase>(
      () => SembastDatabase(opener: SembastIoOpener()),
    );
  }

  /// Network ///
  locator
    ..enableRegisteringMultipleInstancesOfOneType()
    ..registerSingletonAsync<Square1Api>(Square1ApiClient.create)
    ..registerSingletonAsync<GoogleMapsApi>(GoogleMapsApiClient.create)
    ..registerSingletonAsync<NetworkService>(
      MultitecApiClient.create,
      instanceName: 'MultitecApi',
    )
    ..registerSingletonWithDependencies<CitySearchRepository>(
      () => ApiCitySearchRepository(
        square1Api: locator<Square1Api>(),
        googleMapsApi: locator<GoogleMapsApi>(),
      ),
      dependsOn: [Square1Api, GoogleMapsApi],
    );

  /// EventBus ///
  locator.registerLazySingleton<EventBus>(EventBusImpl.new);

  /// App Settings ///
  /// DataSource
  locator.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSource(locator<LocalStorageService>()),
  );

  // Repository
  locator.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(locator<SettingsLocalDataSource>()),
  );

  // Cubit
  locator.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(locator<SettingsRepository>()),
  );
  locator.registerLazySingleton<LocaleCubit>(
    () => LocaleCubit(locator<SettingsRepository>()),
  );

  /// Example Feature ///
  // Datasources
  locator.registerLazySingleton<ExampleRemoteDataSource>(
    () => true
        ? ExampleMockDataSource()
        : ExampleRemoteDataSourceImpl(
            locator<NetworkService>(instanceName: 'MultitecApi'),
          ),
  );
  locator.registerLazySingleton<ExampleLocalDataSource>(
    () => ExampleLocalDataSource(locator<LocalDatabase>()),
  );

  // Repository
  locator.registerLazySingleton<ExampleRepository>(
    () => ExampleRepositoryImpl(
      locator<ExampleRemoteDataSource>(),
      locator<ExampleLocalDataSource>(),
    ),
  );

  // UseCases
  locator.registerFactory(
    () => FetchExampleItemsUseCase(locator<ExampleRepository>()),
  );
  locator.registerFactory(
    () => SendReportUseCase(locator<ExampleRepository>()),
  );

  /// Auth Feature ///
  // Datasources
  locator.registerLazySingleton<FirebaseAuthDataSource>(
    () => useMocks ? MockAuthDataSource() : FirebaseAuthDataSource(),
  );

  // Repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator<FirebaseAuthDataSource>()),
  );

  // Services
  locator.registerLazySingleton<AuthService>(
    () => AuthService(locator<FirebaseAuthDataSource>()),
  );

  // UseCases
  locator.registerFactory(
    () => SignInWithGoogleUseCase(locator<AuthRepository>()),
  );
  locator.registerFactory(
    () => SignOutUseCase(
      locator<AuthRepository>(),
      locator<ScheduleRepository>(),
    ),
  );

  /// User Feature ///
  // Repository
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(locator<FirebaseAuthDataSource>()),
  );

  // Cubits
  locator.registerLazySingleton<UserCubit>(
    () => UserCubit(locator<UserRepository>(), locator<AuthService>()),
  );

  /// Schedule Feature ///
  // Datasources
  locator.registerLazySingleton<ScheduleRemoteDataSource>(
    () => useMocks ? ScheduleMockDataSource() : ScheduleRemoteDataSource(),
  );
  locator.registerLazySingleton<ScheduleLocalDataSource>(
    () => ScheduleLocalDataSource(locator<LocalDatabase>()),
  );

  // Repository
  locator.registerLazySingleton<ScheduleRepository>(
    () => ScheduleRepositoryImpl(
      locator<ScheduleRemoteDataSource>(),
      locator<ScheduleLocalDataSource>(),
    ),
  );

  // UseCases
  locator.registerFactory<GetScheduleItemsByTypeUseCase>(
    () => GetScheduleItemsByTypeUseCase(locator<ScheduleRepository>()),
  );
  locator.registerFactory<GetLatestScheduleItemsUseCase>(
    () => GetLatestScheduleItemsUseCase(locator<ScheduleRepository>()),
  );
  locator.registerFactory<IsJoinedUseCase>(
    () => IsJoinedUseCase(
      locator<ScheduleRepository>(),
      locator<UserRepository>(),
    ),
  );
  locator.registerFactory<ToggleJoinScheduleItemUseCase>(
    () => ToggleJoinScheduleItemUseCase(
      locator<ScheduleRepository>(),
      locator<UserRepository>(),
      locator<EventBus>(),
    ),
  );
  locator.registerFactory<GetJoinedScheduleItemsUseCase>(
    () => GetJoinedScheduleItemsUseCase(
      locator<ScheduleRepository>(),
      locator<UserRepository>(),
    ),
  );
  locator.registerFactory(
    () => JoinedSchedulesCubit(
      locator<GetJoinedScheduleItemsUseCase>(),
      locator<EventBus>(),
    ),
  );

  await locator.allReady();
}

void serviceLocatorDispose() {
  locator.reset();
}
