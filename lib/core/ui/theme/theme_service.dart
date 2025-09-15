import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multitec_app/core/local_storage/local_storage.dart';
import 'package:multitec_app/core/local_storage/local_storage_keys.dart';

class ThemeService {
  ThemeService(this._storage);

  final LocalStorageService _storage;
  static const String _key = LocalStorageKeys.themeMode;

  final ValueNotifier<ThemeMode> _mode = ValueNotifier(ThemeMode.light);

  ValueListenable<ThemeMode> get modeListenable => _mode;
  ThemeMode get mode => _mode.value;

  Future<void> initialize() async {
    final raw = await _storage.getData(_key);
    _mode.value = _fromRaw(raw) ?? ThemeMode.light;
  }

  Future<void> set(ThemeMode mode) async {
    if (_mode.value == mode) return;
    _mode.value = mode;
    await _storage.saveData(_key, _toRaw(mode));
  }

  Future<void> toggle() async {
    final next =
        _mode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await set(next);
  }

  String _toRaw(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.system:
        return 'system';
    }
  }

  ThemeMode? _fromRaw(String? raw) {
    switch (raw) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return null;
    }
  }
}
