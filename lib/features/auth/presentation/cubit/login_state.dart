import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/user/domain/models/user.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default(StateStatus.initial) StateStatus status,
    Failure? failure,
  }) = _LoginState;
}
