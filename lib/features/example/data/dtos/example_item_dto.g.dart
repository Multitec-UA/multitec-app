// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExampleItemDto _$ExampleItemDtoFromJson(Map<String, dynamic> json) =>
    _ExampleItemDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ExampleItemDtoToJson(_ExampleItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
