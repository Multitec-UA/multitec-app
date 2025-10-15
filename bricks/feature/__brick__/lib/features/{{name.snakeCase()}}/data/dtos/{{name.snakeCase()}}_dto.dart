import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_dto.freezed.dart';
part '{{name.snakeCase()}}_dto.g.dart';

@freezed
abstract class {{name.pascalCase()}}Dto with _${{name.pascalCase()}}Dto {
  const factory {{name.pascalCase()}}Dto() = _{{name.pascalCase()}}Dto;

  const {{name.pascalCase()}}Dto._();

  factory {{name.pascalCase()}}Dto.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}DtoFromJson(json);

  {{name.pascalCase()}} toDomain() => const {{name.pascalCase()}}();
}
