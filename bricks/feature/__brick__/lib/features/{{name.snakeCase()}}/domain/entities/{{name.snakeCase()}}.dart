// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';
part '{{name.snakeCase()}}.g.dart';

@freezed
abstract class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  const factory {{name.pascalCase()}}() = _{{name.pascalCase()}};

  factory {{name.pascalCase()}}.fromJson(Map<String, Object?> json) =>
      _${{name.pascalCase()}}FromJson(json);
}
