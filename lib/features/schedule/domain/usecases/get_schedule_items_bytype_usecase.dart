import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/entities/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/entities/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class GetScheduleItemsByTypeUseCase {
  GetScheduleItemsByTypeUseCase(this._repository);
  final ScheduleRepository _repository;

  Future<Result<PaginatedResult<ScheduleItem>, Failure>> call({
    required ScheduleType type,
    String? cursor,
    int? limit,
  }) => _repository.getScheduleItemsByType(
    type,
    PaginationParams(
      cursor: cursor,
      limit: limit ?? 20,
    ), //TODO: Ver esto para no pasar 20 a pelo
  );
}
