class ScheduleItem {
  const ScheduleItem({
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

  ScheduleItem copyWith({
    String? id,
    String? type,
    String? title,
    String? description,
    DateTime? startsAt,
    DateTime? endsAt,
    String? location,
    String? imageUrl,
    String? category,
    bool? published,
    int? attendeesCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ScheduleItem(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      published: published ?? this.published,
      attendeesCount: attendeesCount ?? this.attendeesCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
