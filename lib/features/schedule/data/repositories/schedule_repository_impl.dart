import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_local_datasource.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:multitec_app/features/schedule/domain/models/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/models/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/user/domain/models/user.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl(this._remote, this._local);

  final ScheduleRemoteDataSource _remote;
  final ScheduleLocalDataSource _local;

  @override
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getScheduleItemsByType(
    ScheduleType type,
    PaginationParams params,
  ) {
    return guardAsync<PaginatedResult<ScheduleItem>>(
      () async {
        try {
          final paginatedDto =
              await _remote.getScheduleItemsByType(type, params);
          final items = paginatedDto.items;
          await _local.saveScheduleItems(items);
          return paginatedDto.toDomain((dto) => dto.toDomain());
        } catch (e) {
          final localItems = await _local.getScheduleItemsByType(type);
          return PaginatedResult<ScheduleItem>(
            items: localItems.map((dto) => dto.toDomain()).toList(),
            nextCursor: null,
            hasMore: false,
          );
        }
      },
      hint: 'ScheduleRepository.getScheduleItemsByType',
    );
  }

  @override
  Future<Result<List<ScheduleItem>, Failure>> getLatestScheduleItems(
      {int limit = 5}) {
    return guardAsync<List<ScheduleItem>>(
      () async {
        try {
          final dtos = await _remote.getLatestScheduleItems(limit: limit);
          await _local.saveScheduleItems(dtos);
          return dtos.map((e) => e.toDomain()).toList();
        } catch (e) {
          final localItems = await _local.getLatestScheduleItems(limit: limit);
          return localItems.map((dto) => dto.toDomain()).toList();
        }
      },
      hint: 'ScheduleRepository.getLatestScheduleItems',
    );
  }

  @override
  Future<Result<Unit, Failure>> joinScheduleItem(String itemId, User user) {
    return guardAsync<Unit>(
      () async {
        await _remote.joinScheduleItem(itemId, user);
        await _local.markAsJoined(user.id, itemId);
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
        await _local.markAsLeft(user.id, itemId);
        return unit;
      },
      hint: 'ScheduleRepository.leaveScheduleItem',
    );
  }

  @override
  Future<Result<bool, Failure>> isJoined(String itemId, User user) {
    return guardAsync<bool>(
      () async {
        try {
          return await _remote.isJoined(itemId, user);
        } catch (e) {
          return await _local.isJoined(user.id, itemId);
        }
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
        try {
          final paginatedDto =
              await _remote.getJoinedScheduleItems(userId, params);
          final items = paginatedDto.items;
          await _local.saveScheduleItems(items);
          return paginatedDto.toDomain((dto) => dto.toDomain());
        } catch (e) {
          final localItems = await _local.getJoinedScheduleItems(userId);
          return PaginatedResult<ScheduleItem>(
            items: localItems.map((dto) => dto.toDomain()).toList(),
            nextCursor: null,
            hasMore: false,
          );
        }
      },
      hint: 'ScheduleRepository.getJoinedScheduleItems',
    );
  }
}
