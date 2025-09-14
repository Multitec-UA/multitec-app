import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multitec_app/features/schedule/data/dtos/paginated_result_dto.dart';
import 'package:multitec_app/features/schedule/data/dtos/schedule_item_dto.dart';
import 'package:multitec_app/features/schedule/domain/models/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/user/domain/models/user.dart';

class ScheduleRemoteDataSource {
  ScheduleRemoteDataSource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<PaginatedResultDto<ScheduleItemDto>> getScheduleItemsByType(
    ScheduleType type,
    PaginationParams params,
  ) async {
    var query = _firestore
        .collection('schedule')
        .where('published', isEqualTo: true)
        .where('type', isEqualTo: type.value)
        .orderBy('createdAt', descending: true);

    if (params.cursor != null) {
      final cursorDoc =
          await _firestore.collection('schedule').doc(params.cursor).get();
      if (cursorDoc.exists) {
        query = query.startAfterDocument(cursorDoc);
      }
    }

    query = query.limit(params.limit + 1);

    final snapshot = await query.get();
    final docs = snapshot.docs;

    final hasMore = docs.length > params.limit;
    final itemDocs = hasMore ? docs.take(params.limit).toList() : docs;

    final items = <ScheduleItemDto>[];
    for (final doc in itemDocs) {
      final data = doc.data();
      data.addEntries({'id': doc.id}.entries);
      items.add(ScheduleItemDto.fromMap(data));
    }

    final nextCursor = hasMore && items.isNotEmpty ? items.last.id : null;

    return PaginatedResultDto<ScheduleItemDto>(
      items: items,
      nextCursor: nextCursor,
      hasMore: hasMore,
    );
  }

  Future<List<ScheduleItemDto>> getLatestScheduleItems({int limit = 5}) async {
    final now = DateTime.now();
    final query = _firestore
        .collection('schedule')
        .where('published', isEqualTo: true)
        .where('startsAt', isGreaterThanOrEqualTo: Timestamp.fromDate(now))
        .orderBy('startsAt')
        .limit(limit);

    final snapshot = await query.get();
    final docs = snapshot.docs;
    final items = <ScheduleItemDto>[];
    for (final doc in docs) {
      final data = doc.data();
      data.addEntries({'id': doc.id}.entries);
      items.add(ScheduleItemDto.fromMap(data));
    }
    return items;
  }

  Future<void> joinScheduleItem(String itemId, User user) async {
    final itemRef = _firestore.collection('schedule').doc(itemId);
    final attendeeRef = itemRef.collection('attendees').doc(user.id);
    final userAttendRef = _firestore
        .collection('user_attendances')
        .doc(user.id)
        .collection('items')
        .doc(itemId);

    await _firestore.runTransaction((tx) async {
      final joinedSnap = await tx.get(userAttendRef);
      if (joinedSnap.exists) return;

      tx.set(attendeeRef, {
        'joinedAt': FieldValue.serverTimestamp(),
        'displayName': user.name,
      });

      tx.set(userAttendRef, {
        'joinedAt': FieldValue.serverTimestamp(),
      });

      tx.update(itemRef, {
        'attendeesCount': FieldValue.increment(1),
      });
    });
  }

  Future<void> leaveScheduleItem(String itemId, User user) async {
    final itemRef = _firestore.collection('schedule').doc(itemId);
    final attendeeRef = itemRef.collection('attendees').doc(user.id);
    final userAttendRef = _firestore
        .collection('user_attendances')
        .doc(user.id)
        .collection('items')
        .doc(itemId);

    await _firestore.runTransaction((tx) async {
      final joinedSnap = await tx.get(userAttendRef);
      if (!joinedSnap.exists) return;

      tx.delete(attendeeRef);
      tx.delete(userAttendRef);

      tx.update(itemRef, {
        'attendeesCount': FieldValue.increment(-1),
      });
    });
  }

  Future<bool> isJoined(String itemId, User user) async {
    final userAttendDoc = await _firestore
        .collection('user_attendances')
        .doc(user.id)
        .collection('items')
        .doc(itemId)
        .get();

    return userAttendDoc.exists;
  }

  Future<PaginatedResultDto<ScheduleItemDto>> getJoinedScheduleItems(
    String userId,
    PaginationParams params,
  ) async {
    var query = _firestore
        .collection('user_attendances')
        .doc(userId)
        .collection('items')
        .orderBy('joinedAt', descending: true);

    if (params.cursor != null) {
      final cursorDoc = await _firestore
          .collection('user_attendances')
          .doc(userId)
          .collection('items')
          .doc(params.cursor)
          .get();
      if (cursorDoc.exists) {
        query = query.startAfterDocument(cursorDoc);
      }
    }

    query = query.limit(params.limit + 1);

    final joinedSnap = await query.get();
    final joinedDocs = joinedSnap.docs;

    if (joinedDocs.isEmpty) {
      return const PaginatedResultDto<ScheduleItemDto>(
        items: [],
        hasMore: false,
      );
    }

    final hasMore = joinedDocs.length > params.limit;
    final itemDocs =
        hasMore ? joinedDocs.take(params.limit).toList() : joinedDocs;

    final ids = itemDocs.map((d) => d.id).toList();
    final items = <ScheduleItemDto>[];

    const chunkSize = 10;
    for (var i = 0; i < ids.length; i += chunkSize) {
      final chunk = ids.sublist(i, (i + chunkSize).clamp(0, ids.length));
      final scheduleQuery = await _firestore
          .collection('schedule')
          .where(FieldPath.documentId, whereIn: chunk)
          .get();

      for (final doc in scheduleQuery.docs) {
        final data = doc.data();
        data.addEntries({'id': doc.id}.entries);
        items.add(ScheduleItemDto.fromMap(data));
      }
    }

    final joinedAtById = {
      for (final d in itemDocs)
        d.id: (d.data()['joinedAt'] as Timestamp?)?.toDate() ??
            DateTime.fromMillisecondsSinceEpoch(0),
    };
    items.sort((a, b) => (joinedAtById[b.id]!).compareTo(joinedAtById[a.id]!));

    final nextCursor = hasMore && itemDocs.isNotEmpty ? itemDocs.last.id : null;

    return PaginatedResultDto<ScheduleItemDto>(
      items: items,
      nextCursor: nextCursor,
      hasMore: hasMore,
    );
  }
}
