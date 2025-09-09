import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';

abstract class ScheduleRepository {
  Future<Result<List<ScheduleItem>, Failure>> getScheduleItems(
    ScheduleType type,
  );
  Future<Result<Unit, Failure>> joinScheduleItem(String itemId);
  Future<Result<Unit, Failure>> leaveScheduleItem(String itemId);
  Future<Result<bool, Failure>> isJoined(String itemId);
}
