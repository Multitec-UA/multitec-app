// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleDetailState {
  StateStatus get status;
  StateStatus get joinStatus;
  StateStatus get isJoinedStatus;
  ScheduleItem? get item;
  bool get isJoined;
  Failure? get failure;
  Failure? get joinFailure;
  Failure? get isJoinedFailure;

  /// Create a copy of ScheduleDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleDetailStateCopyWith<ScheduleDetailState> get copyWith =>
      _$ScheduleDetailStateCopyWithImpl<ScheduleDetailState>(
          this as ScheduleDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.joinStatus, joinStatus) ||
                other.joinStatus == joinStatus) &&
            (identical(other.isJoinedStatus, isJoinedStatus) ||
                other.isJoinedStatus == isJoinedStatus) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.isJoined, isJoined) ||
                other.isJoined == isJoined) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.joinFailure, joinFailure) ||
                other.joinFailure == joinFailure) &&
            (identical(other.isJoinedFailure, isJoinedFailure) ||
                other.isJoinedFailure == isJoinedFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, joinStatus,
      isJoinedStatus, item, isJoined, failure, joinFailure, isJoinedFailure);

  @override
  String toString() {
    return 'ScheduleDetailState(status: $status, joinStatus: $joinStatus, isJoinedStatus: $isJoinedStatus, item: $item, isJoined: $isJoined, failure: $failure, joinFailure: $joinFailure, isJoinedFailure: $isJoinedFailure)';
  }
}

/// @nodoc
abstract mixin class $ScheduleDetailStateCopyWith<$Res> {
  factory $ScheduleDetailStateCopyWith(
          ScheduleDetailState value, $Res Function(ScheduleDetailState) _then) =
      _$ScheduleDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {StateStatus status,
      StateStatus joinStatus,
      StateStatus isJoinedStatus,
      ScheduleItem? item,
      bool isJoined,
      Failure? failure,
      Failure? joinFailure,
      Failure? isJoinedFailure});
}

/// @nodoc
class _$ScheduleDetailStateCopyWithImpl<$Res>
    implements $ScheduleDetailStateCopyWith<$Res> {
  _$ScheduleDetailStateCopyWithImpl(this._self, this._then);

  final ScheduleDetailState _self;
  final $Res Function(ScheduleDetailState) _then;

  /// Create a copy of ScheduleDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? joinStatus = null,
    Object? isJoinedStatus = null,
    Object? item = freezed,
    Object? isJoined = null,
    Object? failure = freezed,
    Object? joinFailure = freezed,
    Object? isJoinedFailure = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      joinStatus: null == joinStatus
          ? _self.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      isJoinedStatus: null == isJoinedStatus
          ? _self.isJoinedStatus
          : isJoinedStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as ScheduleItem?,
      isJoined: null == isJoined
          ? _self.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      joinFailure: freezed == joinFailure
          ? _self.joinFailure
          : joinFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isJoinedFailure: freezed == isJoinedFailure
          ? _self.isJoinedFailure
          : isJoinedFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleDetailState].
extension ScheduleDetailStatePatterns on ScheduleDetailState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ScheduleDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ScheduleDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ScheduleDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            StateStatus status,
            StateStatus joinStatus,
            StateStatus isJoinedStatus,
            ScheduleItem? item,
            bool isJoined,
            Failure? failure,
            Failure? joinFailure,
            Failure? isJoinedFailure)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState() when $default != null:
        return $default(
            _that.status,
            _that.joinStatus,
            _that.isJoinedStatus,
            _that.item,
            _that.isJoined,
            _that.failure,
            _that.joinFailure,
            _that.isJoinedFailure);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            StateStatus status,
            StateStatus joinStatus,
            StateStatus isJoinedStatus,
            ScheduleItem? item,
            bool isJoined,
            Failure? failure,
            Failure? joinFailure,
            Failure? isJoinedFailure)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState():
        return $default(
            _that.status,
            _that.joinStatus,
            _that.isJoinedStatus,
            _that.item,
            _that.isJoined,
            _that.failure,
            _that.joinFailure,
            _that.isJoinedFailure);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            StateStatus status,
            StateStatus joinStatus,
            StateStatus isJoinedStatus,
            ScheduleItem? item,
            bool isJoined,
            Failure? failure,
            Failure? joinFailure,
            Failure? isJoinedFailure)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState() when $default != null:
        return $default(
            _that.status,
            _that.joinStatus,
            _that.isJoinedStatus,
            _that.item,
            _that.isJoined,
            _that.failure,
            _that.joinFailure,
            _that.isJoinedFailure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScheduleDetailState implements ScheduleDetailState {
  const _ScheduleDetailState(
      {this.status = StateStatus.initial,
      this.joinStatus = StateStatus.initial,
      this.isJoinedStatus = StateStatus.initial,
      this.item,
      this.isJoined = false,
      this.failure,
      this.joinFailure,
      this.isJoinedFailure});

  @override
  @JsonKey()
  final StateStatus status;
  @override
  @JsonKey()
  final StateStatus joinStatus;
  @override
  @JsonKey()
  final StateStatus isJoinedStatus;
  @override
  final ScheduleItem? item;
  @override
  @JsonKey()
  final bool isJoined;
  @override
  final Failure? failure;
  @override
  final Failure? joinFailure;
  @override
  final Failure? isJoinedFailure;

  /// Create a copy of ScheduleDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleDetailStateCopyWith<_ScheduleDetailState> get copyWith =>
      __$ScheduleDetailStateCopyWithImpl<_ScheduleDetailState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.joinStatus, joinStatus) ||
                other.joinStatus == joinStatus) &&
            (identical(other.isJoinedStatus, isJoinedStatus) ||
                other.isJoinedStatus == isJoinedStatus) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.isJoined, isJoined) ||
                other.isJoined == isJoined) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.joinFailure, joinFailure) ||
                other.joinFailure == joinFailure) &&
            (identical(other.isJoinedFailure, isJoinedFailure) ||
                other.isJoinedFailure == isJoinedFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, joinStatus,
      isJoinedStatus, item, isJoined, failure, joinFailure, isJoinedFailure);

  @override
  String toString() {
    return 'ScheduleDetailState(status: $status, joinStatus: $joinStatus, isJoinedStatus: $isJoinedStatus, item: $item, isJoined: $isJoined, failure: $failure, joinFailure: $joinFailure, isJoinedFailure: $isJoinedFailure)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleDetailStateCopyWith<$Res>
    implements $ScheduleDetailStateCopyWith<$Res> {
  factory _$ScheduleDetailStateCopyWith(_ScheduleDetailState value,
          $Res Function(_ScheduleDetailState) _then) =
      __$ScheduleDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {StateStatus status,
      StateStatus joinStatus,
      StateStatus isJoinedStatus,
      ScheduleItem? item,
      bool isJoined,
      Failure? failure,
      Failure? joinFailure,
      Failure? isJoinedFailure});
}

/// @nodoc
class __$ScheduleDetailStateCopyWithImpl<$Res>
    implements _$ScheduleDetailStateCopyWith<$Res> {
  __$ScheduleDetailStateCopyWithImpl(this._self, this._then);

  final _ScheduleDetailState _self;
  final $Res Function(_ScheduleDetailState) _then;

  /// Create a copy of ScheduleDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? joinStatus = null,
    Object? isJoinedStatus = null,
    Object? item = freezed,
    Object? isJoined = null,
    Object? failure = freezed,
    Object? joinFailure = freezed,
    Object? isJoinedFailure = freezed,
  }) {
    return _then(_ScheduleDetailState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      joinStatus: null == joinStatus
          ? _self.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      isJoinedStatus: null == isJoinedStatus
          ? _self.isJoinedStatus
          : isJoinedStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as ScheduleItem?,
      isJoined: null == isJoined
          ? _self.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      joinFailure: freezed == joinFailure
          ? _self.joinFailure
          : joinFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isJoinedFailure: freezed == isJoinedFailure
          ? _self.isJoinedFailure
          : isJoinedFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

// dart format on
