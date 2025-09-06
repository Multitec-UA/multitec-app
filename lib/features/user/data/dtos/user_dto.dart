import 'package:multitec_app/features/user/domain/models/user.dart';

class UserDTO {
  const UserDTO({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      photoUrl: json['photoUrl'] as String?,
    );
  }

  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  User toDomain() => User(
        id: id,
        name: name,
        email: email,
        photoUrl: photoUrl,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
      };
}
