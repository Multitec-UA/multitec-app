import 'dart:async';
import 'package:multitec_app/features/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:multitec_app/features/schedule/data/dtos/paginated_result_dto.dart';
import 'package:multitec_app/features/schedule/data/dtos/schedule_item_dto.dart';
import 'package:multitec_app/features/schedule/domain/entities/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';

class ScheduleMockDataSource implements ScheduleRemoteDataSource {
  ScheduleMockDataSource();

  static const _mockEvents = [
    {
      'id': 'event_1',
      'title': 'Conferencia de Tecnología',
      'description':
          'Una conferencia sobre las últimas tendencias en tecnología',
      'daysFromNow': 5,
      'location': 'Aula Magna',
      'category': 'Tecnología',
      'attendeesCount': 45,
    },
    {
      'id': 'event_2',
      'title': 'Feria de Empleo',
      'description': 'Oportunidades laborales para estudiantes',
      'daysFromNow': 12,
      'location': 'Campus Central',
      'category': 'Empleo',
      'attendeesCount': 120,
    },
    {
      'id': 'event_3',
      'title': 'Hackathon 2024',
      'description': 'Competencia de programación de 48 horas',
      'daysFromNow': 20,
      'location': 'Laboratorio de Informática',
      'category': 'Programación',
      'attendeesCount': 32,
    },
  ];

  static const _mockActivities = [
    {
      'id': 'activity_1',
      'title': 'Taller de Flutter',
      'description': 'Aprende a desarrollar aplicaciones móviles con Flutter',
      'daysFromNow': 3,
      'location': 'Aula 201',
      'category': 'Desarrollo',
      'attendeesCount': 25,
    },
    {
      'id': 'activity_2',
      'title': 'Club de Lectura Tech',
      'description': 'Discusión sobre libros de tecnología y programación',
      'daysFromNow': 8,
      'location': 'Biblioteca',
      'category': 'Educación',
      'attendeesCount': 15,
    },
    {
      'id': 'activity_3',
      'title': 'Sesión de Networking',
      'description': 'Conecta con otros estudiantes y profesionales',
      'daysFromNow': 15,
      'location': 'Cafetería Central',
      'category': 'Networking',
      'attendeesCount': 60,
    },
  ];

  @override
  Future<PaginatedResultDto<ScheduleItemDto>> getScheduleItemsByType(
    ScheduleType type,
    PaginationParams params,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final now = DateTime.now();
    final baseItems = type == ScheduleType.event
        ? _mockEvents
        : _mockActivities;

    final allItems = <ScheduleItemDto>[];

    for (final item in baseItems) {
      final data = <String, dynamic>{
        'id': item['id']! as String,
        'type': type.value,
        'title': item['title']! as String,
        'description': item['description']! as String,
        'startsAt': now.add(Duration(days: item['daysFromNow']! as int)),
        'endsAt': item['endsAt'] != null
            ? now.add(Duration(days: item['daysFromNow']! as int, hours: 2))
            : null,
        'location': item['location'] as String?,
        'category': item['category'] as String?,
        'published': true,
        'attendeesCount': item['attendeesCount']! as int,
        'createdAt': now.subtract(
          Duration(days: (item['daysFromNow']! as int) + 1),
        ),
        'updatedAt': now.subtract(
          Duration(days: (item['daysFromNow']! as int) + 1),
        ),
      };

      allItems.add(ScheduleItemDto.fromMap(data));
    }

    var startIndex = 0;
    if (params.cursor != null) {
      startIndex = allItems.indexWhere((item) => item.id == params.cursor);
      if (startIndex != -1) {
        startIndex += 1;
      } else {
        startIndex = 0;
      }
    }

    final endIndex = (startIndex + params.limit).clamp(0, allItems.length);
    final paginatedItems = allItems.sublist(startIndex, endIndex);
    final hasMore = endIndex < allItems.length;
    final nextCursor = hasMore && paginatedItems.isNotEmpty
        ? paginatedItems.last.id
        : null;

    return PaginatedResultDto<ScheduleItemDto>(
      items: paginatedItems,
      nextCursor: nextCursor,
      hasMore: hasMore,
      totalCount: allItems.length,
    );
  }

  @override
  Future<List<ScheduleItemDto>> getLatestScheduleItems({int limit = 5}) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final now = DateTime.now();
    final base = [..._mockEvents, ..._mockActivities];
    final items = base.map((item) {
      final isEvent = _mockEvents.contains(item);
      final type = isEvent ? ScheduleType.event : ScheduleType.activity;
      final data = <String, dynamic>{
        'id': item['id']! as String,
        'type': type.value,
        'title': item['title']! as String,
        'description': item['description']! as String,
        'startsAt': now.add(Duration(days: item['daysFromNow']! as int)),
        'endsAt': item['endsAt'] != null
            ? now.add(Duration(days: item['daysFromNow']! as int, hours: 2))
            : null,
        'location': item['location'] as String?,
        'category': item['category'] as String?,
        'published': true,
        'attendeesCount': item['attendeesCount']! as int,
        'createdAt': now.subtract(
          Duration(days: (item['daysFromNow']! as int) + 1),
        ),
        'updatedAt': now.subtract(
          Duration(days: (item['daysFromNow']! as int) + 1),
        ),
      };
      return ScheduleItemDto.fromMap(data);
    }).toList()..sort((a, b) => a.startsAt.compareTo(b.startsAt));
    return items.take(limit).toList();
  }

  @override
  Future<void> joinScheduleItem(String itemId, User user) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> leaveScheduleItem(String itemId, User user) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Future<bool> isJoined(String itemId, User user) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return false;
  }

  @override
  Future<PaginatedResultDto<ScheduleItemDto>> getJoinedScheduleItems(
    String userId,
    PaginationParams params,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final allItems = [..._mockEvents, ..._mockActivities];
    final joinedItems = allItems
        .where((item) {
          return userId == 'mock_user_id';
        })
        .take(3)
        .toList();

    final startIndex = params.cursor != null
        ? joinedItems.indexWhere((item) => item['id'] == params.cursor) + 1
        : 0;

    if (startIndex < 0) {
      return const PaginatedResultDto<ScheduleItemDto>(
        items: [],
        hasMore: false,
      );
    }

    final endIndex = (startIndex + params.limit).clamp(0, joinedItems.length);
    final pageItems = joinedItems.sublist(startIndex, endIndex);
    final hasMore = endIndex < joinedItems.length;
    final nextCursor = hasMore && pageItems.isNotEmpty
        ? pageItems.last['id'] as String?
        : null;

    final now = DateTime.now();
    final items = <ScheduleItemDto>[];
    for (final item in pageItems) {
      final isEvent = _mockEvents.contains(item);
      final type = isEvent ? ScheduleType.event : ScheduleType.activity;
      final data = <String, dynamic>{
        'id': (item['id']! as String),
        'type': type.value,
        'title': (item['title']! as String),
        'description': (item['description']! as String),
        'startsAt': now.add(Duration(days: item['daysFromNow']! as int)),
        'endsAt': item['endsAt'] != null
            ? now.add(Duration(days: item['daysFromNow']! as int, hours: 2))
            : null,
        'location': item['location'] as String?,
        'category': item['category'] as String?,
        'published': true,
        'attendeesCount': item['attendeesCount']! as int,
        'createdAt': now.subtract(
          Duration(days: (item['daysFromNow']! as int) + 1),
        ),
        'updatedAt': now.subtract(
          Duration(days: (item['daysFromNow']! as int) + 1),
        ),
      };
      items.add(ScheduleItemDto.fromMap(data));
    }

    return PaginatedResultDto<ScheduleItemDto>(
      items: items,
      nextCursor: nextCursor,
      hasMore: hasMore,
    );
  }
}
