import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:multitec_app/features/schedule/domain/models/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/models/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/user/domain/models/user.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl(this._remote);

  final ScheduleRemoteDataSource _remote;

  @override
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getScheduleItemsByType(
    ScheduleType type,
    PaginationParams params,
  ) {
    return guardAsync<PaginatedResult<ScheduleItem>>(
      () async {
        final paginatedDto = await _remote.getScheduleItemsByType(type, params);
        return paginatedDto.toDomain((dto) => dto.toDomain());
      },
      hint: 'ScheduleRepository.getScheduleItemsByType',
    );
  }

  @override
  Future<Result<List<ScheduleItem>, Failure>> getLatestScheduleItems({int limit = 5}) {
    return guardAsync<List<ScheduleItem>>(
      () async {
        final dtos = await _remote.getLatestScheduleItems(limit: limit);
        return dtos.map((e) => e.toDomain()).toList();
      },
      hint: 'ScheduleRepository.getLatestScheduleItems',
    );
  }

  @override
  Future<Result<Unit, Failure>> joinScheduleItem(String itemId, User user) {
    return guardAsync<Unit>(
      () async {
        await _remote.joinScheduleItem(itemId, user);
        return unit;
      },
      hint: 'ScheduleRepository.joinScheduleItem',
    );
  }

  @override
  Future<Result<Unit, Failure>> leaveScheduleItem(String itemId, User user) {
    return guardAsync<Unit>(
      () async {
        await _remote.leaveScheduleItem(itemId, user);
        return unit;
      },
      hint: 'ScheduleRepository.leaveScheduleItem',
    );
  }

  @override
  Future<Result<bool, Failure>> isJoined(String itemId, User user) {
    return guardAsync<bool>(
      () async {
        return _remote.isJoined(itemId, user);
      },
      hint: 'ScheduleRepository.isJoined',
    );
  }

  @override
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getJoinedScheduleItems(
    String userId,
    PaginationParams params,
  ) {
    return guardAsync(
      () async {
        final paginatedDto =
            await _remote.getJoinedScheduleItems(userId, params);
        return paginatedDto.toDomain((dto) => dto.toDomain());
      },
      hint: 'ScheduleRepository.getJoinedScheduleItems',
    );
  }
}
