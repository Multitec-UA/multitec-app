import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class GetLatestScheduleItemsUseCase {
  GetLatestScheduleItemsUseCase(this._repository);
  final ScheduleRepository _repository;

  final int limit = 7;

  Future<Result<List<ScheduleItem>, Failure>> call() {
    return _repository.getLatestScheduleItems(limit: limit);
  }
}
