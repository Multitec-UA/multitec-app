import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._authRemoteDataSource);
  final FirebaseAuthDataSource _authRemoteDataSource;

  @override
  Result<User?, Failure> getUser() {
    return guardSync<User?>(() {
      final userDto = _authRemoteDataSource.getCurrentUser();
      final user = userDto?.toDomain();
      return user;
    }, hint: 'UserRepository.getUser');
  }
}
