import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/features/settings/domain/repositories/settings_repository.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._repo) : super(ThemeMode.system);

  final SettingsRepository _repo;

  Future<void> init() async {
    final saved = await _repo.getThemeMode();
    emit(saved);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    emit(mode);
    await _repo.saveThemeMode(mode);
  }
}
