import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/example/domain/models/example_item.dart';
import 'package:multitec_app/features/example/domain/repositories/example_repository.dart';

class FetchExampleItemsUseCase {
  FetchExampleItemsUseCase(this._repo);
  final ExampleRepository _repo;

  Future<Result<List<ExampleItem>, Failure>> call() => _repo.fetchItems();
}
