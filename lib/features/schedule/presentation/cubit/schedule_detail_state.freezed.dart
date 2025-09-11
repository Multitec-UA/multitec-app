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
  ScheduleItem get item;
  StateStatus get toggleJoinStatus;
  bool get isJoined;
  Failure? get failure;

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
            (identical(other.item, item) || other.item == item) &&
            (identical(other.toggleJoinStatus, toggleJoinStatus) ||
                other.toggleJoinStatus == toggleJoinStatus) &&
            (identical(other.isJoined, isJoined) ||
                other.isJoined == isJoined) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, item, toggleJoinStatus, isJoined, failure);

  @override
  String toString() {
    return 'ScheduleDetailState(item: $item, toggleJoinStatus: $toggleJoinStatus, isJoined: $isJoined, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $ScheduleDetailStateCopyWith<$Res> {
  factory $ScheduleDetailStateCopyWith(
          ScheduleDetailState value, $Res Function(ScheduleDetailState) _then) =
      _$ScheduleDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {ScheduleItem item,
      StateStatus toggleJoinStatus,
      bool isJoined,
      Failure? failure});
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
    Object? item = null,
    Object? toggleJoinStatus = null,
    Object? isJoined = null,
    Object? failure = freezed,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as ScheduleItem,
      toggleJoinStatus: null == toggleJoinStatus
          ? _self.toggleJoinStatus
          : toggleJoinStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      isJoined: null == isJoined
          ? _self.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
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
    TResult Function(ScheduleItem item, StateStatus toggleJoinStatus,
            bool isJoined, Failure? failure)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState() when $default != null:
        return $default(
            _that.item, _that.toggleJoinStatus, _that.isJoined, _that.failure);
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
    TResult Function(ScheduleItem item, StateStatus toggleJoinStatus,
            bool isJoined, Failure? failure)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState():
        return $default(
            _that.item, _that.toggleJoinStatus, _that.isJoined, _that.failure);
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
    TResult? Function(ScheduleItem item, StateStatus toggleJoinStatus,
            bool isJoined, Failure? failure)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleDetailState() when $default != null:
        return $default(
            _that.item, _that.toggleJoinStatus, _that.isJoined, _that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScheduleDetailState implements ScheduleDetailState {
  const _ScheduleDetailState(
      {required this.item,
      this.toggleJoinStatus = StateStatus.initial,
      this.isJoined = false,
      this.failure});

  @override
  final ScheduleItem item;
  @override
  @JsonKey()
  final StateStatus toggleJoinStatus;
  @override
  @JsonKey()
  final bool isJoined;
  @override
  final Failure? failure;

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
            (identical(other.item, item) || other.item == item) &&
            (identical(other.toggleJoinStatus, toggleJoinStatus) ||
                other.toggleJoinStatus == toggleJoinStatus) &&
            (identical(other.isJoined, isJoined) ||
                other.isJoined == isJoined) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, item, toggleJoinStatus, isJoined, failure);

  @override
  String toString() {
    return 'ScheduleDetailState(item: $item, toggleJoinStatus: $toggleJoinStatus, isJoined: $isJoined, failure: $failure)';
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
      {ScheduleItem item,
      StateStatus toggleJoinStatus,
      bool isJoined,
      Failure? failure});
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
    Object? item = null,
    Object? toggleJoinStatus = null,
    Object? isJoined = null,
    Object? failure = freezed,
  }) {
    return _then(_ScheduleDetailState(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as ScheduleItem,
      toggleJoinStatus: null == toggleJoinStatus
          ? _self.toggleJoinStatus
          : toggleJoinStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      isJoined: null == isJoined
          ? _self.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

// dart format on
