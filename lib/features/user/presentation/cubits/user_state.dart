import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';

part 'user_state.freezed.dart';

@freezed
sealed class UserState with _$UserState {
  const factory UserState({
    @Default(RequestStatus.initial) RequestStatus status,
    User? user,
    Failure? failure,
  }) = _UserState;
}
