import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_item.freezed.dart';

@freezed
abstract class ScheduleItem with _$ScheduleItem {
  const factory ScheduleItem({
    required String id,
    required String type,
    required String title,
    required String description,
    required DateTime startsAt,
    required bool published,
    required int attendeesCount,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? endsAt,
    String? location,
    String? imageUrl,
    String? category,
  }) = _ScheduleItem;
}
