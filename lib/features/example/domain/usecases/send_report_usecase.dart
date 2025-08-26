import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/example/domain/repositories/example_repository.dart';

class SendReportUseCase {
  SendReportUseCase(this._repo);
  final ExampleRepository _repo;

  Future<Result<Unit, Failure>> call() => _repo.sendReport();
}
