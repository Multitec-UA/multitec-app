import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multitec_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:multitec_app/features/settings/presentation/cubits/locale_cubit.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  group('LocaleCubit', () {
    late SettingsRepository settingsRepository;

    const tLocaleEn = Locale('en');
    const tLocaleEs = Locale('es');

    setUpAll(() {
      registerFallbackValue(const Locale('en'));
    });

    setUp(() {
      settingsRepository = MockSettingsRepository();
    });

    LocaleCubit createCubit() => LocaleCubit(settingsRepository);

    test('initial state is null', () {
      final cubit = createCubit();

      expect(cubit.state, isNull);

      cubit.close();
    });

    group('init', () {
      blocTest<LocaleCubit, Locale?>(
        'emits saved locale when repository returns a locale',
        build: () {
          when(
            () => settingsRepository.getLocale(),
          ).thenAnswer((_) async => tLocaleEn);
          return createCubit();
        },
        act: (cubit) => cubit.init(),
        expect: () => [tLocaleEn],
        verify: (_) {
          verify(() => settingsRepository.getLocale()).called(1);
        },
      );

      blocTest<LocaleCubit, Locale?>(
        'emits null when repository returns null',
        build: () {
          when(
            () => settingsRepository.getLocale(),
          ).thenAnswer((_) async => null);
          return createCubit();
        },
        act: (cubit) => cubit.init(),
        expect: () => [null],
        verify: (_) {
          verify(() => settingsRepository.getLocale()).called(1);
        },
      );
    });

    group('setLocale', () {
      blocTest<LocaleCubit, Locale?>(
        'emits new locale and saves to repository',
        build: () {
          when(
            () => settingsRepository.saveLocale(any()),
          ).thenAnswer((_) async => {});
          return createCubit();
        },
        act: (cubit) => cubit.setLocale(tLocaleEs),
        expect: () => [tLocaleEs],
        verify: (_) {
          verify(() => settingsRepository.saveLocale(tLocaleEs)).called(1);
        },
      );

      blocTest<LocaleCubit, Locale?>(
        'emits new locale immediately before saving',
        build: () {
          when(() => settingsRepository.saveLocale(any())).thenAnswer(
            (_) async => Future.delayed(const Duration(milliseconds: 100)),
          );
          return createCubit();
        },
        act: (cubit) => cubit.setLocale(tLocaleEn),
        expect: () => [tLocaleEn],
      );

      blocTest<LocaleCubit, Locale?>(
        'changes locale multiple times',
        build: () {
          when(
            () => settingsRepository.saveLocale(any()),
          ).thenAnswer((_) async => {});
          return createCubit();
        },
        act: (cubit) async {
          await cubit.setLocale(tLocaleEn);
          await cubit.setLocale(tLocaleEs);
        },
        expect: () => [tLocaleEn, tLocaleEs],
        verify: (_) {
          verify(() => settingsRepository.saveLocale(tLocaleEn)).called(1);
          verify(() => settingsRepository.saveLocale(tLocaleEs)).called(1);
        },
      );
    });

    group('close', () {
      test('closes without errors', () async {
        final cubit = createCubit();

        await expectLater(cubit.close(), completes);
      });
    });
  });
}
