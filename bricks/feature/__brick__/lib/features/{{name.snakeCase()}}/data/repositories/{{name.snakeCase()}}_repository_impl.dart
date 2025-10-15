import 'package:multitec_app/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_local_datasource.dart';
import 'package:multitec_app/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_remote_datasource.dart';
import 'package:multitec_app/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl(this._remote, this._local);

    final {{name.pascalCase()}}RemoteDataSource _remote;
    final {{name.pascalCase()}}LocalDataSource _local;
}
