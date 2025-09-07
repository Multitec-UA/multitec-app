import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:multitec_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:multitec_app/features/auth/domain/enums/autentication_status.dart';

class AuthService {
  AuthService(this._authRemoteDataSource);

  final FirebaseAuthDataSource _authRemoteDataSource;

  final ValueNotifier<AuthenticationStatus> _statusNotifier =
      ValueNotifier(AuthenticationStatus.unknown);
  String? _token;
  StreamSubscription<String?>? _tokenSub;
  StreamSubscription<dynamic>? _authSub;

  // Getters
  AuthenticationStatus get status => _statusNotifier.value;
  String? get token => _token;
  ValueListenable<AuthenticationStatus> get statusListenable => _statusNotifier;
  bool get isAuthenticated =>
      _statusNotifier.value == AuthenticationStatus.authenticated;

  // Setter to update authentication status reactively
  set status(AuthenticationStatus value) {
    _statusNotifier.value = value;
  }

  Future<void> initialize() async {
    // Determine initial status using FirebaseAuth
    final currentUser = _authRemoteDataSource.getCurrentUser();
    if (currentUser != null) {
      status = AuthenticationStatus.authenticated;
    } else {
      status = AuthenticationStatus.unauthenticated;
    }

    // Subscribe to auth state changes to keep status updated
    await _authSub?.cancel();
    _authSub = _authRemoteDataSource.authStateChanges().listen((user) {
      if (user != null) {
        status = AuthenticationStatus.authenticated;
      } else {
        _token = null;
        status = AuthenticationStatus.unauthenticated;
      }
    });

    // Subscribe to ID token changes to maintain a fresh token in memory
    await _tokenSub?.cancel();
    _tokenSub = _authRemoteDataSource.idTokenChanges().listen((freshToken) {
      _token = freshToken;
    });
  }

  void dispose() {
    _tokenSub?.cancel();
    _authSub?.cancel();
    _statusNotifier.dispose();
  }
}
