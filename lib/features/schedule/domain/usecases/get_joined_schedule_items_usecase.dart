import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/entities/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/entities/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';

class GetJoinedScheduleItemsUseCase {
  GetJoinedScheduleItemsUseCase(this._scheduleRepository, this._userRepository);

  final ScheduleRepository _scheduleRepository;
  final UserRepository _userRepository;

  Future<Result<PaginatedResult<ScheduleItem>, Failure>> call({
    String? cursor,
    int limit = PaginationParams.defaultLimit,
  }) async {
    final userResult = _userRepository.getUser();

    return userResult.when((user) {
      if (user == null) return const Result.error(GenericFailure());

      return _scheduleRepository.getJoinedScheduleItems(
        user.id,
        PaginationParams(cursor: cursor, limit: limit),
      );
    }, Result.error);
  }
}
