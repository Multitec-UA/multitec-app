import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multitec_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:multitec_app/features/settings/presentation/cubits/theme_cubit.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  group('ThemeCubit', () {
    late SettingsRepository settingsRepository;

    setUpAll(() {
      registerFallbackValue(ThemeMode.system);
    });

    setUp(() {
      settingsRepository = MockSettingsRepository();
    });

    ThemeCubit createCubit() => ThemeCubit(settingsRepository);

    test('initial state is ThemeMode.system', () {
      final cubit = createCubit();

      expect(cubit.state, equals(ThemeMode.system));

      cubit.close();
    });

    group('init', () {
      blocTest<ThemeCubit, ThemeMode>(
        'emits saved theme mode when repository returns light mode',
        build: () {
          when(
            () => settingsRepository.getThemeMode(),
          ).thenAnswer((_) async => ThemeMode.light);
          return createCubit();
        },
        act: (cubit) => cubit.init(),
        expect: () => [ThemeMode.light],
        verify: (_) {
          verify(() => settingsRepository.getThemeMode()).called(1);
        },
      );

      blocTest<ThemeCubit, ThemeMode>(
        'emits saved theme mode when repository returns dark mode',
        build: () {
          when(
            () => settingsRepository.getThemeMode(),
          ).thenAnswer((_) async => ThemeMode.dark);
          return createCubit();
        },
        act: (cubit) => cubit.init(),
        expect: () => [ThemeMode.dark],
        verify: (_) {
          verify(() => settingsRepository.getThemeMode()).called(1);
        },
      );

      blocTest<ThemeCubit, ThemeMode>(
        'emits saved theme mode when repository returns system mode',
        build: () {
          when(
            () => settingsRepository.getThemeMode(),
          ).thenAnswer((_) async => ThemeMode.system);
          return createCubit();
        },
        act: (cubit) => cubit.init(),
        expect: () => [ThemeMode.system],
        verify: (_) {
          verify(() => settingsRepository.getThemeMode()).called(1);
        },
      );
    });

    group('setThemeMode', () {
      blocTest<ThemeCubit, ThemeMode>(
        'emits light mode and saves to repository',
        build: () {
          when(
            () => settingsRepository.saveThemeMode(any()),
          ).thenAnswer((_) async => {});
          return createCubit();
        },
        act: (cubit) => cubit.setThemeMode(ThemeMode.light),
        expect: () => [ThemeMode.light],
        verify: (_) {
          verify(
            () => settingsRepository.saveThemeMode(ThemeMode.light),
          ).called(1);
        },
      );

      blocTest<ThemeCubit, ThemeMode>(
        'emits dark mode and saves to repository',
        build: () {
          when(
            () => settingsRepository.saveThemeMode(any()),
          ).thenAnswer((_) async => {});
          return createCubit();
        },
        act: (cubit) => cubit.setThemeMode(ThemeMode.dark),
        expect: () => [ThemeMode.dark],
        verify: (_) {
          verify(
            () => settingsRepository.saveThemeMode(ThemeMode.dark),
          ).called(1);
        },
      );

      blocTest<ThemeCubit, ThemeMode>(
        'emits new theme mode immediately before saving',
        build: () {
          when(() => settingsRepository.saveThemeMode(any())).thenAnswer(
            (_) async => Future.delayed(const Duration(milliseconds: 100)),
          );
          return createCubit();
        },
        act: (cubit) => cubit.setThemeMode(ThemeMode.dark),
        expect: () => [ThemeMode.dark],
      );

      blocTest<ThemeCubit, ThemeMode>(
        'changes theme mode multiple times',
        build: () {
          when(
            () => settingsRepository.saveThemeMode(any()),
          ).thenAnswer((_) async => {});
          return createCubit();
        },
        act: (cubit) async {
          await cubit.setThemeMode(ThemeMode.light);
          await cubit.setThemeMode(ThemeMode.dark);
          await cubit.setThemeMode(ThemeMode.system);
        },
        expect: () => [ThemeMode.light, ThemeMode.dark, ThemeMode.system],
        verify: (_) {
          verify(
            () => settingsRepository.saveThemeMode(ThemeMode.light),
          ).called(1);
          verify(
            () => settingsRepository.saveThemeMode(ThemeMode.dark),
          ).called(1);
          verify(
            () => settingsRepository.saveThemeMode(ThemeMode.system),
          ).called(1);
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
