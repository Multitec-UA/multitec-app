import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/features/settings/domain/repositories/settings_repository.dart';

class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit(this._repo) : super(null);

  final SettingsRepository _repo;

  Future<void> init() async {
    final saved = await _repo.getLocale();
    emit(saved);
  }

  Future<void> setLocale(Locale locale) async {
    emit(locale);
    await _repo.saveLocale(locale);
  }
}
