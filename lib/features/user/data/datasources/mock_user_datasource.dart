import 'package:multitec_app/features/user/data/datasources/local_user_datasource.dart';
import 'package:multitec_app/features/user/models/user.dart';

class MockUserDatasource implements LocalUserDataSource {
  @override
  Future<User> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    throw UnimplementedError();
  }

  @override
  Future<void> removeToken() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveToken(String token) {
    throw UnimplementedError();
  }
}
