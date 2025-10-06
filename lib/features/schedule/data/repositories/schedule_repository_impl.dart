import 'dart:async';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/error_reporter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_local_datasource.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:multitec_app/features/schedule/domain/entities/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/entities/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl(this._remote, this._local);

  final ScheduleRemoteDataSource _remote;
  final ScheduleLocalDataSource _local;

  @override
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getScheduleItemsByType(
    ScheduleType type,
    PaginationParams params,
  ) {
    return guardAsync<PaginatedResult<ScheduleItem>>(() async {
      final paginatedDto = await _remote.getScheduleItemsByType(type, params);
      return paginatedDto.toDomain((dto) => dto.toDomain());
    }, hint: 'ScheduleRepository.getScheduleItemsByType');
  }

  @override
  Future<Result<List<ScheduleItem>, Failure>> getLatestScheduleItems({
    int limit = 5,
  }) {
    return guardAsync<List<ScheduleItem>>(() async {
      final dtos = await _remote.getLatestScheduleItems(limit: limit);
      return dtos.map((e) => e.toDomain()).toList();
    }, hint: 'ScheduleRepository.getLatestScheduleItems');
  }

  @override
  Future<Result<Unit, Failure>> joinScheduleItem(ScheduleItem item, User user) {
    return guardAsync<Unit>(() async {
      await _remote.joinScheduleItem(item.id, user);
      return unit;
    }, hint: 'ScheduleRepository.joinScheduleItem');
  }

  @override
  Future<Result<Unit, Failure>> leaveScheduleItem(
    ScheduleItem item,
    User user,
  ) {
    return guardAsync<Unit>(() async {
      await _remote.leaveScheduleItem(item.id, user);
      await _local.removeJoinedScheduleItem(item.id);
      return unit;
    }, hint: 'ScheduleRepository.leaveScheduleItem');
  }

  @override
  Future<Result<bool, Failure>> isJoined(String itemId, User user) {
    return guardAsync<bool>(() async {
      final existsLocalJoined = await _local.existsJoinedScheduleItem(itemId);
      if (existsLocalJoined) return true;
      return _remote.isJoined(itemId, user);
    }, hint: 'ScheduleRepository.isJoined');
  }

  @override
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getJoinedScheduleItems(
    String userId,
    PaginationParams params,
  ) async {
    return guardAsync<PaginatedResult<ScheduleItem>>(() async {
      if (params.cursor == null) {
        final localItems = await _local.getJoinedScheduleItems();
        if (localItems.isNotEmpty) {
          unawaited(_refreshJoinedSchedulesInBackground(userId));
          final domainItems = localItems.map((dto) => dto.toDomain()).toList();
          return PaginatedResult<ScheduleItem>(
            items: domainItems,
            nextCursor: domainItems.isNotEmpty ? domainItems.last.id : null,
            hasMore: true,
          );
        }
      }

      final paginatedDto = await _remote.getJoinedScheduleItems(userId, params);

      await _local.saveJoinedScheduleItems(paginatedDto.items);

      return paginatedDto.toDomain((dto) => dto.toDomain());
    }, hint: 'ScheduleRepository.getJoinedScheduleItems');
  }

  Future<void> _refreshJoinedSchedulesInBackground(String userId) async {
    try {
      final paginatedDto = await _remote.getJoinedScheduleItems(
        userId,
        const PaginationParams(),
      );
      await _local.saveJoinedScheduleItems(paginatedDto.items);
    } catch (e, s) {
      ErrorReporter().report(
        e,
        stackTrace: s,
        hint: 'ScheduleRepository._refreshJoinedSchedulesInBackground',
      );
    }
  }

  @override
  Future<Result<Unit, Failure>> clearJoinedScheduleLocal() {
    return guardAsync<Unit>(() async {
      await _local.clearJoinedScheduleItems();
      return unit;
    }, hint: 'ScheduleRepository.clearJoinedScheduleLocal');
  }
}
