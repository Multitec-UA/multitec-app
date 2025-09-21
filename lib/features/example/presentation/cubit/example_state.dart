import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/example/domain/entities/example_item.dart';

part 'example_state.freezed.dart';

@freezed
sealed class ExampleState with _$ExampleState {
  const factory ExampleState({
    @Default(<ExampleItem>[]) List<ExampleItem> items,
    @Default(RequestStatus.initial) RequestStatus listStatus,
    @Default(RequestStatus.initial) RequestStatus reportStatus,
    Failure? listFailure,
    Failure? reportFailure,
  }) = _ExampleState;
}
