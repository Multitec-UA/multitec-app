import 'dart:convert';

import 'package:multitec_app/core/local_storage/local_storage.dart';
import 'package:multitec_app/features/user/models/user.dart';

class LocalUserDataSource {
  LocalUserDataSource(this._localStorage);
  final LocalStorageService _localStorage;
  //TODO: Guardar aqui las keys??
  final String _userKey = 'user';
  final String _tokenKey = 'token';

  Future<User> getUser() async {
    final user = await _localStorage.getData(_userKey);

    if (user == null) {
      //TODO: Lanzar una Exception tal cual??
      throw Exception('User not found');
    }

    final json = jsonDecode(user) as Map<String, dynamic>;
    return User.fromJson(json);
  }

  Future<void> updateUser(User user) async {
    final userJson = jsonEncode(user.toJson());
    return _localStorage.saveData(_userKey, userJson);
  }

  Future<String> getToken() async {
    final token = await _localStorage.getData(_tokenKey);

    if (token == null) {
      //TODO: Lanzar una Exception tal cual??
      throw Exception('Token not found');
    }

    return token;
  }

  Future<void> removeToken() async {
    return _localStorage.removeData(_tokenKey);
  }

  Future<void> saveToken(String token) async {
    return _localStorage.saveData(_tokenKey, token);
  }
}
