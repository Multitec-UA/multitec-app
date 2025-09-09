import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class GetScheduleItemsUseCase {
  GetScheduleItemsUseCase(this._repository);
  final ScheduleRepository _repository;

  Future<Result<List<ScheduleItem>, Failure>> call(ScheduleType type) =>
      _repository.getScheduleItems(type);
}
