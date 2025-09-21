import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';

part 'sign_in_state.freezed.dart';

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState({
    @Default(RequestStatus.initial) RequestStatus status,
    Failure? failure,
  }) = _SignInState;
}
