import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/models/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/models/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/user/domain/models/user.dart';

abstract class ScheduleRepository {
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getScheduleItemsByType(
    ScheduleType type,
    PaginationParams params,
  );
  Future<Result<List<ScheduleItem>, Failure>> getLatestScheduleItems({int limit});
  Future<Result<Unit, Failure>> joinScheduleItem(String itemId, User user);
  Future<Result<Unit, Failure>> leaveScheduleItem(String itemId, User user);
  Future<Result<bool, Failure>> isJoined(String itemId, User user);
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getJoinedScheduleItems(
    String userId,
    PaginationParams params,
  );
}
