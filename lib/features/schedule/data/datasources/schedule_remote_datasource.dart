import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
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

  Future<PaginatedResultDto<ScheduleItemDto>> getScheduleItems(
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

  Future<void> joinScheduleItem(String itemId, User user) async {
    final batch = _firestore.batch();

    final itemRef = _firestore.collection('schedule').doc(itemId);
    final attendeeRef = itemRef.collection('attendees').doc(user.id);

    batch.set(attendeeRef, {
      'joinedAt': FieldValue.serverTimestamp(),
      'displayName': user.name,
    });

    batch.update(itemRef, {
      'attendeesCount': FieldValue.increment(1),
    });

    await batch.commit();
  }

  Future<void> leaveScheduleItem(String itemId, User user) async {
    final batch = _firestore.batch();

    final itemRef = _firestore.collection('schedule').doc(itemId);
    final attendeeRef = itemRef.collection('attendees').doc(user.id);

    batch.delete(attendeeRef);

    batch.update(itemRef, {
      'attendeesCount': FieldValue.increment(-1),
    });

    await batch.commit();
  }

  Future<bool> isJoined(String itemId, User user) async {
    final attendeeDoc = await _firestore
        .collection('schedule')
        .doc(itemId)
        .collection('attendees')
        .doc(user.id)
        .get();

    return attendeeDoc.exists;
  }
}
