import 'dart:async';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authRemoteDataSource);

  final FirebaseAuthDataSource _authRemoteDataSource;

  @override
  Future<Result<Unit, Failure>> signInWithGoogle() {
    return guardAsync<Unit>(() async {
      await _authRemoteDataSource.signInWithGoogle();
      return unit;
    }, hint: 'AuthRepository.signInWithGoogle');
  }

  @override
  Future<Result<Unit, Failure>> signOut() {
    return guardAsync<Unit>(() async {
      await _authRemoteDataSource.signOut();
      return unit;
    }, hint: 'AuthRepository.signOut');
  }
}
