import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';

class ScheduleItemDto {
  const ScheduleItemDto({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.startsAt,
    required this.published,
    required this.attendeesCount,
    required this.createdAt,
    required this.updatedAt,
    this.endsAt,
    this.location,
    this.imageUrl,
    this.category,
  });

  factory ScheduleItemDto.fromMap(Map<String, dynamic> map) {
    return ScheduleItemDto(
      id: map['id'] as String,
      type: map['type'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      startsAt: _toDate(map['startsAt']),
      endsAt: _toDateOrNull(map['endsAt']),
      location: map['location'] as String?,
      imageUrl: map['imageUrl'] as String?,
      category: map['category'] as String?,
      published: map['published'] as bool,
      attendeesCount: map['attendeesCount'] as int,
      createdAt: _toDate(map['createdAt']),
      updatedAt: _toDate(map['updatedAt']),
    );
  }

  final String id;
  final String type;
  final String title;
  final String description;
  final DateTime startsAt;
  final DateTime? endsAt;
  final String? location;
  final String? imageUrl;
  final String? category;
  final bool published;
  final int attendeesCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  ScheduleItem toDomain() => ScheduleItem(
        id: id,
        type: type,
        title: title,
        description: description,
        startsAt: startsAt,
        endsAt: endsAt,
        location: location,
        imageUrl: imageUrl,
        category: category,
        published: published,
        attendeesCount: attendeesCount,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Map<String, dynamic> toFirestore() => {
        'type': type,
        'title': title,
        'description': description,
        'startsAt': Timestamp.fromDate(startsAt),
        if (endsAt != null) 'endsAt': Timestamp.fromDate(endsAt!),
        if (location != null) 'location': location,
        if (imageUrl != null) 'imageUrl': imageUrl,
        if (category != null) 'category': category,
        'published': published,
        'attendeesCount': attendeesCount,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

  Map<String, Object?> toJson() => {
        'id': id,
        'type': type,
        'title': title,
        'description': description,
        'startsAt': startsAt.millisecondsSinceEpoch,
        if (endsAt != null) 'endsAt': endsAt!.millisecondsSinceEpoch,
        if (location != null) 'location': location,
        if (imageUrl != null) 'imageUrl': imageUrl,
        if (category != null) 'category': category,
        'published': published,
        'attendeesCount': attendeesCount,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };

  factory ScheduleItemDto.fromJson(Map<String, Object?> json) {
    return ScheduleItemDto(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startsAt: DateTime.fromMillisecondsSinceEpoch(json['startsAt'] as int),
      endsAt: json['endsAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['endsAt'] as int)
          : null,
      location: json['location'] as String?,
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String?,
      published: json['published'] as bool,
      attendeesCount: json['attendeesCount'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
    );
  }

  static DateTime _toDate(dynamic value) => (value as Timestamp).toDate();
  static DateTime? _toDateOrNull(dynamic value) =>
      value == null ? null : (value as Timestamp).toDate();
}
