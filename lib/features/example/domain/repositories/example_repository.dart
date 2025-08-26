import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/example/domain/models/example_item.dart';

abstract class ExampleRepository {
  Future<Result<List<ExampleItem>, Failure>> fetchItems();
  Future<Result<Unit, Failure>> sendReport();
}
