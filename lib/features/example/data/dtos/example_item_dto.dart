import 'package:multitec_app/features/example/domain/models/example_item.dart';

class ExampleItemDto {
  const ExampleItemDto({
    required this.id,
    required this.title,
    this.description,
  });

  factory ExampleItemDto.fromJson(Map<String, dynamic> json) => ExampleItemDto(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
      );

  final String id;
  final String title;
  final String? description;

  ExampleItem toDomain() => ExampleItem(
        id: id,
        title: title,
        description: description,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        if (description != null) 'description': description,
      };
}
