import 'package:multitec_app/core/database/db_stores.dart';
import 'package:multitec_app/core/database/local_database.dart';
import 'package:multitec_app/features/schedule/data/dtos/schedule_item_dto.dart';

class ScheduleLocalDataSource {
  ScheduleLocalDataSource(this._db);

  final LocalDatabase _db;
  String get _store => DbStores.joinedScheduleItems;

  Future<List<ScheduleItemDto>> getJoinedScheduleItems() async {
    final data = await _db.getAll(
      _store,
      sortField: 'joinedAt',
      descending: true,
    );
    return data.map(ScheduleItemDto.fromJson).toList();
  }

  Future<void> saveJoinedScheduleItems(
    List<ScheduleItemDto> items,
  ) async {
    final itemsMap = <String, Map<String, Object?>>{};
    for (final item in items) {
      itemsMap[item.id] = item.toJson();
    }
    await _db.saveAll(_store, itemsMap);
  }

  Future<void> saveJoinedScheduleItem(
    ScheduleItemDto item,
  ) async {
    await _db.save(_store, item.id, item.toJson());
  }

  Future<void> removeJoinedScheduleItem(
    String itemId,
  ) async {
    await _db.delete(_store, itemId);
  }

  Future<bool> existsJoinedScheduleItem(String itemId) async {
    return _db.exists(_store, itemId);
  }

  Future<void> clearJoinedScheduleItems() async {
    await _db.clear(_store);
  }
}
