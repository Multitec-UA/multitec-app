import 'package:multitec_app/core/database/db_stores.dart';
import 'package:multitec_app/core/database/local_database.dart';
import 'package:multitec_app/features/schedule/data/dtos/schedule_item_dto.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';

class ScheduleLocalDataSource {
  ScheduleLocalDataSource(this._db);

  final LocalDatabase _db;

  Future<List<ScheduleItemDto>> getScheduleItemsByType(
      ScheduleType type) async {
    final data = await _db.getAll(DbStores.scheduleItems);
    final filtered = data.where((item) => item['type'] == type.name).toList();
    return filtered.map(ScheduleItemDto.fromJson).toList();
  }

  Future<List<ScheduleItemDto>> getLatestScheduleItems({int limit = 5}) async {
    final data = await _db.getAll(DbStores.scheduleItems);
    final now = DateTime.now();

    final items = data
        .map(ScheduleItemDto.fromJson)
        .where((item) => item.published && item.startsAt.isAfter(now))
        .toList();

    items.sort((a, b) => a.startsAt.compareTo(b.startsAt));
    return items.take(limit).toList();
  }

  Future<List<ScheduleItemDto>> getJoinedScheduleItems(String userId) async {
    final data = await _db.getAll(DbStores.joinedScheduleItems);
    final userJoined = data
        .where((item) => item['userId'] == userId)
        .map((item) => item['scheduleItemId'] as String)
        .toSet();

    if (userJoined.isEmpty) return [];

    final allItems = await _db.getAll(DbStores.scheduleItems);
    final joinedItems = allItems
        .where((item) => userJoined.contains(item['id']))
        .map(ScheduleItemDto.fromJson)
        .toList();

    joinedItems.sort((a, b) => a.startsAt.compareTo(b.startsAt));
    return joinedItems;
  }

  Future<void> saveScheduleItems(List<ScheduleItemDto> items) async {
    final itemsMap = <String, Map<String, Object?>>{};
    for (final item in items) {
      itemsMap[item.id] = item.toJson();
    }
    await _db.saveAll(DbStores.scheduleItems, itemsMap);
  }

  Future<void> saveScheduleItem(ScheduleItemDto item) async {
    await _db.save(DbStores.scheduleItems, item.id, item.toJson());
  }

  Future<void> markAsJoined(String userId, String scheduleItemId) async {
    final joinKey = '${userId}_$scheduleItemId';
    await _db.save(DbStores.joinedScheduleItems, joinKey, {
      'userId': userId,
      'scheduleItemId': scheduleItemId,
      'joinedAt': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<void> markAsLeft(String userId, String scheduleItemId) async {
    final joinKey = '${userId}_$scheduleItemId';
    await _db.delete(DbStores.joinedScheduleItems, joinKey);
  }

  Future<bool> isJoined(String userId, String scheduleItemId) async {
    final joinKey = '${userId}_$scheduleItemId';
    return _db.exists(DbStores.joinedScheduleItems, joinKey);
  }

  Future<void> updateAttendeeCount(String scheduleItemId, int newCount) async {
    final existingData = await _db.get(DbStores.scheduleItems, scheduleItemId);
    if (existingData != null) {
      final updatedData = Map<String, Object?>.from(existingData);
      updatedData['attendeesCount'] = newCount;
      updatedData['updatedAt'] = DateTime.now().millisecondsSinceEpoch;
      await _db.save(DbStores.scheduleItems, scheduleItemId, updatedData);
    }
  }

  Future<void> saveLastSyncMetadata(String key, DateTime timestamp) async {
    await _db.save(DbStores.scheduleMetadata, key, {
      'lastSync': timestamp.millisecondsSinceEpoch,
    });
  }

  Future<DateTime?> getLastSyncMetadata(String key) async {
    final data = await _db.get(DbStores.scheduleMetadata, key);
    if (data == null) return null;
    final timestamp = data['lastSync'] as int?;
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }

  Future<void> clearScheduleItems() async {
    await _db.clear(DbStores.scheduleItems);
  }

  Future<void> clearJoinedItems() async {
    await _db.clear(DbStores.joinedScheduleItems);
  }
}
