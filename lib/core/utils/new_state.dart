import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';

part 'new_state.freezed.dart';

@freezed
class AsyncValue<T> with _$AsyncValue<T> {
  const factory AsyncValue.idle() = _Idle<T>;
  const factory AsyncValue.loading() = _Loading<T>;
  const factory AsyncValue.data(
    T value, {
    @Default(false) bool refreshing,
    Failure? refreshError,
  }) = _Data<T>;
  const factory AsyncValue.error(Failure failure) = _Error<T>;
}
