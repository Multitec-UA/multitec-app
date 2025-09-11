import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/models/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/models/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';

abstract class ScheduleRepository {
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getScheduleItems(
    ScheduleType type,
    PaginationParams params,
  );
  Future<Result<Unit, Failure>> joinScheduleItem(String itemId);
  Future<Result<Unit, Failure>> leaveScheduleItem(String itemId);
  Future<Result<bool, Failure>> isJoined(String itemId);
}
