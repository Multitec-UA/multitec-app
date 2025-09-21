import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String id,
    required String name,
    required String email,
    String? photoUrl,
  }) = _UserDTO;

  const UserDTO._();

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  User toDomain() => User(id: id, name: name, email: email, photoUrl: photoUrl);
}
