// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'photoUrl': instance.photoUrl,
};
