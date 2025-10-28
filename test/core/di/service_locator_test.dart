import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/network/network_service.dart';
import 'package:multitec_app/core/preferences/local_storage.dart';
import 'package:multitec_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_local_datasource.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_joined_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_latest_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_bytype_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_schedule_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/joined/joined_schedules_cubit.dart';
import 'package:multitec_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:multitec_app/features/settings/presentation/cubits/locale_cubit.dart';
import 'package:multitec_app/features/settings/presentation/cubits/theme_cubit.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';

void main() {
  

  tearDown(() async {
    if (locator.isRegistered<EventBus>()) {
      serviceLocatorDispose();
    } else {
      GetIt.instance.reset();
    }
  });

  group('service_locator', () {
    test('serviceLocatorSetUp registers and gets core services', () async {
      await serviceLocatorSetUp();

      expect(locator.allReadySync(), true);

      final storage = locator<LocalStorageService>();
      final eventBus = locator<EventBus>();

      expect(storage, isA<LocalStorageService>());
      expect(eventBus, isA<EventBus>());

      final mapsApi = locator<NetworkService>(instanceName: 'GoogleMapsApi');
      final multitecApi = locator<NetworkService>(instanceName: 'MultitecApi');

      expect(mapsApi, isA<NetworkService>());
      expect(multitecApi, isA<NetworkService>());

      final themeCubit = locator<ThemeCubit>();
      final localeCubit = locator<LocaleCubit>();

      expect(themeCubit, isA<ThemeCubit>());
      expect(localeCubit, isA<LocaleCubit>());
    });

    test('serviceLocatorSetUp registers feature components', () async {
      await serviceLocatorSetUp();

      expect(locator.isRegistered<SettingsRepository>(), true);
      expect(locator.isRegistered<FirebaseAuthDataSource>(), true);
      expect(locator.isRegistered<AuthRepository>(), true);
      expect(locator.isRegistered<AuthService>(), true);
      expect(locator.isRegistered<SignInWithGoogleUseCase>(), true);
      expect(locator.isRegistered<SignOutUseCase>(), true);

      expect(locator.isRegistered<UserRepository>(), true);
      expect(locator.isRegistered<UserCubit>(), true);

      expect(locator.isRegistered<ScheduleRemoteDataSource>(), true);
      expect(locator.isRegistered<ScheduleLocalDataSource>(), true);
      expect(locator.isRegistered<ScheduleRepository>(), true);
      expect(locator.isRegistered<GetScheduleItemsByTypeUseCase>(), true);
      expect(locator.isRegistered<GetLatestScheduleItemsUseCase>(), true);
      expect(locator.isRegistered<IsJoinedUseCase>(), true);
      expect(locator.isRegistered<ToggleJoinScheduleItemUseCase>(), true);
      expect(locator.isRegistered<GetJoinedScheduleItemsUseCase>(), true);
      expect(locator.isRegistered<JoinedSchedulesCubit>(), true);
    });

    test('serviceLocatorDispose clears registrations', () async {
      await serviceLocatorSetUp();
      serviceLocatorDispose();

      expect(locator.isRegistered<LocalStorageService>(), false);
      expect(locator.isRegistered<ThemeCubit>(), false);
      expect(locator.isRegistered<AuthService>(), false);
      expect(locator.isRegistered<ScheduleRepository>(), false);
    });
  });
}
