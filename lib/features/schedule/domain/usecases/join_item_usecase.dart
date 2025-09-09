import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class JoinItemUseCase {
  JoinItemUseCase(this._repository);
  final ScheduleRepository _repository;

  Future<Result<Unit, Failure>> call(String itemId) =>
      _repository.joinScheduleItem(itemId);
}
