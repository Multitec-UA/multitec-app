import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/user/data/datasources/local_user_datasource.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';
import 'package:multitec_app/features/user/models/user.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.localUserDataSource});
  final LocalUserDataSource localUserDataSource;

  @override
  Future<Result<User, Failure>> getUser() async {
    return guardAsync<User>(
      () async {
        final user = await localUserDataSource.getUser();
        return user;
      },
      hint: 'UserRepository.getUser',
    );
  }

  @override
  Future<Result<Unit, Failure>> updateUser(User user) async {
    return guardAsync<Unit>(
      () async {
        await localUserDataSource.updateUser(user);
        return unit;
      },
      hint: 'UserRepository.updateUser',
    );
  }

  @override
  Future<Result<String, Failure>> getToken() async {
    return guardAsync<String>(
      () async {
        final token = await localUserDataSource.getToken();
        return token;
      },
      hint: 'UserRepository.getToken',
    );
  }

  @override
  Future<Result<Unit, Failure>> removeToken() async {
    return guardAsync<Unit>(
      () async {
        await localUserDataSource.removeToken();
        return unit;
      },
      hint: 'UserRepository.removeToken',
    );
  }

  @override
  Future<Result<Unit, Failure>> saveToken(String token) async {
    return guardAsync<Unit>(
      () async {
        await localUserDataSource.saveToken(token);
        return unit;
      },
      hint: 'UserRepository.saveToken',
    );
  }
}
