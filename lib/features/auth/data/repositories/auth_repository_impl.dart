import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:multitec_app/features/user/data/datasources/local_user_datasource.dart';
import 'package:multitec_app/features/user/models/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authRemoteDataSource, this._localUserDataSource);

  final AuthRemoteDataSource _authRemoteDataSource;
  final LocalUserDataSource _localUserDataSource;

  @override
  Future<Result<User, Failure>> signInWithGoogle() {
    return guardAsync<User>(
      () async {
        final authDto = await _authRemoteDataSource.signInWithGoogle();
        final user = authDto.toDomain();

        await _localUserDataSource.saveToken(authDto.token);
        await _localUserDataSource.updateUser(user);

        return user;
      },
      hint: 'AuthRepository.signInWithGoogle',
    );
  }

  @override
  Future<Result<Unit, Failure>> signOut() {
    return guardAsync<Unit>(
      () async {
        await _authRemoteDataSource.signOut();
        return unit;
      },
      hint: 'AuthRepository.signOut',
    );
  }
}
