import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:multitec_app/features/schedule/domain/models/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/models/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl(this._remote);

  final ScheduleRemoteDataSource _remote;

  @override
  Future<Result<PaginatedResult<ScheduleItem>, Failure>> getScheduleItems(
    ScheduleType type,
    PaginationParams params,
  ) {
    return guardAsync<PaginatedResult<ScheduleItem>>(
      () async {
        final paginatedDto = await _remote.getScheduleItems(type, params);
        return paginatedDto.toDomain((dto) => dto.toDomain());
      },
      hint: 'ScheduleRepository.getScheduleItems',
    );
  }

  @override
  Future<Result<List<ScheduleItem>, Failure>> getScheduleItemsLegacy(
    ScheduleType type,
  ) {
    return guardAsync<List<ScheduleItem>>(
      () async {
        final dtos = await _remote.getScheduleItemsLegacy(type);
        return dtos.map((dto) => dto.toDomain()).toList();
      },
      hint: 'ScheduleRepository.getScheduleItemsLegacy',
    );
  }


  @override
  Future<Result<Unit, Failure>> joinScheduleItem(String itemId) {
    return guardAsync<Unit>(
      () async {
        await _remote.joinScheduleItem(itemId);
        return unit;
      },
      hint: 'ScheduleRepository.joinScheduleItem',
    );
  }

  @override
  Future<Result<Unit, Failure>> leaveScheduleItem(String itemId) {
    return guardAsync<Unit>(
      () async {
        await _remote.leaveScheduleItem(itemId);
        return unit;
      },
      hint: 'ScheduleRepository.leaveScheduleItem',
    );
  }

  @override
  Future<Result<bool, Failure>> isJoined(String itemId) {
    return guardAsync<bool>(
      () async {
        return _remote.isJoined(itemId);
      },
      hint: 'ScheduleRepository.isJoined',
    );
  }
}
