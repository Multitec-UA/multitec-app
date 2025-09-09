import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multitec_app/features/schedule/data/dtos/schedule_item_dto.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';

abstract class ScheduleRemoteDataSource {
  Future<List<ScheduleItemDto>> getScheduleItems(ScheduleType type);
  Future<void> joinScheduleItem(String itemId);
  Future<void> leaveScheduleItem(String itemId);
  Future<bool> isJoined(String itemId);
}

class ScheduleRemoteDataSourceImpl implements ScheduleRemoteDataSource {
  ScheduleRemoteDataSourceImpl({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  @override
  Future<List<ScheduleItemDto>> getScheduleItems(ScheduleType type) async {
    final query = _firestore
        .collection('schedule')
        .where('published', isEqualTo: true)
        .where('type', isEqualTo: type.value)
        .orderBy('createdAt', descending: true)
        .limit(20);

    final snapshot = await query.get();
    final items = <ScheduleItemDto>[];

    for (final doc in snapshot.docs) {
      final data = doc.data();
      data.addEntries({'id': doc.id}.entries);

      items.add(ScheduleItemDto.fromMap(data));
    }

    return items;
  }

  @override
  Future<void> joinScheduleItem(String itemId) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    final batch = _firestore.batch();

    final itemRef = _firestore.collection('schedule').doc(itemId);
    final attendeeRef = itemRef.collection('attendees').doc(currentUser.uid);

    batch.set(attendeeRef, {
      'joinedAt': FieldValue.serverTimestamp(),
      'displayName': currentUser.displayName,
    });

    batch.update(itemRef, {
      'attendeesCount': FieldValue.increment(1),
    });

    await batch.commit();
  }

  @override
  Future<void> leaveScheduleItem(String itemId) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    final batch = _firestore.batch();

    final itemRef = _firestore.collection('schedule').doc(itemId);
    final attendeeRef = itemRef.collection('attendees').doc(currentUser.uid);

    batch.delete(attendeeRef);

    batch.update(itemRef, {
      'attendeesCount': FieldValue.increment(-1),
    });

    await batch.commit();
  }

  @override
  Future<bool> isJoined(String itemId) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return false;

    final attendeeDoc = await _firestore
        .collection('schedule')
        .doc(itemId)
        .collection('attendees')
        .doc(currentUser.uid)
        .get();

    return attendeeDoc.exists;
  }
}
