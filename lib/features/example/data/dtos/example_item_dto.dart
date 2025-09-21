import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/features/example/domain/entities/example_item.dart';

part 'example_item_dto.freezed.dart';
part 'example_item_dto.g.dart';

@freezed
abstract class ExampleItemDto with _$ExampleItemDto {
  const factory ExampleItemDto({
    required String id,
    required String title,
    String? description,
  }) = _ExampleItemDto;

  const ExampleItemDto._();

  factory ExampleItemDto.fromJson(Map<String, dynamic> json) =>
      _$ExampleItemDtoFromJson(json);

  ExampleItem toDomain() =>
      ExampleItem(id: id, title: title, description: description);
}
