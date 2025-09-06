import 'dart:async';
import 'package:multitec_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:multitec_app/features/auth/domain/enums/autentication_status.dart';

class AuthService {
  AuthService(this._authRemoteDataSource);

  final FirebaseAuthDataSource _authRemoteDataSource;
  final StreamController<AuthenticationStatus> _statusController =
      StreamController<AuthenticationStatus>.broadcast();

  AuthenticationStatus _status = AuthenticationStatus.unknown;
  String? _token;
  StreamSubscription<String?>? _tokenSub;
  StreamSubscription<dynamic>? _authSub;

  // Getters
  AuthenticationStatus get status => _status;
  String? get token => _token;
  Stream<AuthenticationStatus> get statusStream => _statusController.stream;
  bool get isAuthenticated => _status == AuthenticationStatus.authenticated;

  Future<void> initialize() async {
    // Determine initial status using FirebaseAuth
    final currentUser = _authRemoteDataSource.getCurrentUser();
    if (currentUser != null) {
      _updateStatus(AuthenticationStatus.authenticated);
    } else {
      _updateStatus(AuthenticationStatus.unauthenticated);
    }

    // Subscribe to auth state changes to keep status updated
    await _authSub?.cancel();
    _authSub = _authRemoteDataSource.authStateChanges().listen((user) {
      if (user != null) {
        _updateStatus(AuthenticationStatus.authenticated);
      } else {
        _token = null;
        _updateStatus(AuthenticationStatus.unauthenticated);
      }
    });

    // Subscribe to ID token changes to maintain a fresh token in memory
    await _tokenSub?.cancel();
    _tokenSub = _authRemoteDataSource.idTokenChanges().listen((freshToken) {
      _token = freshToken;
    });
  }

  void _updateStatus(AuthenticationStatus status) {
    _status = status;
    _statusController.add(status);
  }

  void dispose() {
    _tokenSub?.cancel();
    _authSub?.cancel();
    _statusController.close();
  }
}
