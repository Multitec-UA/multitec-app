import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';

part 'sign_out_state.freezed.dart';

@freezed
sealed class SignOutState with _$SignOutState {
  const factory SignOutState({
    @Default(RequestStatus.initial) RequestStatus status,
    Failure? failure,
  }) = _SignOutState;
}
