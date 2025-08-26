import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/example/data/datasources/example_remote_datasource.dart';
import 'package:multitec_app/features/example/domain/models/example_item.dart';
import 'package:multitec_app/features/example/domain/repositories/example_repository.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  ExampleRepositoryImpl(
    this._remote,
    //this._local,
  );

  final ExampleRemoteDataSource _remote;
  //final ExampleLocalDataSource _local;

  @override
  Future<Result<List<ExampleItem>, Failure>> fetchItems() {
    return guardAsync<List<ExampleItem>>(
      () async {
        final dtos = await _remote.fetchItems();
        return dtos.map((e) => e.toDomain()).toList(growable: false);
      },
      hint: 'ExampleRepository.fetchItems',
    );
  }

  @override
  Future<Result<Unit, Failure>> sendReport() {
    return guardAsync<Unit>(
      () async {
        await _remote.sendReport();
        return unit;
      },
      hint: 'ExampleRepository.sendReport',
    );
  }
}
