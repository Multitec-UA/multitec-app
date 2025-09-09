import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class IsJoinedUseCase {
  IsJoinedUseCase(this._repository);
  final ScheduleRepository _repository;

  Future<Result<bool, Failure>> call(String itemId) =>
      _repository.isJoined(itemId);
}
