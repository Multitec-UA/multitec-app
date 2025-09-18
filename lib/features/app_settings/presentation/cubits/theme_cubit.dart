import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/features/app_settings/domain/repositories/app_settings_repository.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._repo) : super(ThemeMode.light);

  final AppSettingsRepository _repo;

  Future<void> init() async {
    final saved = await _repo.getThemeMode();
    emit(saved);
  }

  Future<void> toggleThemeMode() async {
    final next = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setThemeMode(next);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    emit(mode);
    await _repo.saveThemeMode(mode);
  }
}
