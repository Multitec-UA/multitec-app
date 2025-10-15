import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';

part '{{name.snakeCase()}}_state.freezed.dart';

@freezed
sealed class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    @Default(RequestStatus.initial) RequestStatus status,
    Failure? failure,
  }) = _{{name.pascalCase()}}State;
}
