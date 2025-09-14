// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_carousel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleCarouselState {
  StateStatus get status;
  List<ScheduleItem> get items;
  Failure? get failure;

  /// Create a copy of ScheduleCarouselState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleCarouselStateCopyWith<ScheduleCarouselState> get copyWith =>
      _$ScheduleCarouselStateCopyWithImpl<ScheduleCarouselState>(
          this as ScheduleCarouselState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleCarouselState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(items), failure);

  @override
  String toString() {
    return 'ScheduleCarouselState(status: $status, items: $items, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $ScheduleCarouselStateCopyWith<$Res> {
  factory $ScheduleCarouselStateCopyWith(ScheduleCarouselState value,
          $Res Function(ScheduleCarouselState) _then) =
      _$ScheduleCarouselStateCopyWithImpl;
  @useResult
  $Res call({StateStatus status, List<ScheduleItem> items, Failure? failure});
}

/// @nodoc
class _$ScheduleCarouselStateCopyWithImpl<$Res>
    implements $ScheduleCarouselStateCopyWith<$Res> {
  _$ScheduleCarouselStateCopyWithImpl(this._self, this._then);

  final ScheduleCarouselState _self;
  final $Res Function(ScheduleCarouselState) _then;

  /// Create a copy of ScheduleCarouselState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? failure = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScheduleItem>,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleCarouselState].
extension ScheduleCarouselStatePatterns on ScheduleCarouselState {
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
    TResult Function(_ScheduleCarouselState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleCarouselState() when $default != null:
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
    TResult Function(_ScheduleCarouselState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleCarouselState():
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
    TResult? Function(_ScheduleCarouselState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleCarouselState() when $default != null:
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
            StateStatus status, List<ScheduleItem> items, Failure? failure)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleCarouselState() when $default != null:
        return $default(_that.status, _that.items, _that.failure);
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
            StateStatus status, List<ScheduleItem> items, Failure? failure)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleCarouselState():
        return $default(_that.status, _that.items, _that.failure);
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
            StateStatus status, List<ScheduleItem> items, Failure? failure)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleCarouselState() when $default != null:
        return $default(_that.status, _that.items, _that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScheduleCarouselState implements ScheduleCarouselState {
  const _ScheduleCarouselState(
      {this.status = StateStatus.initial,
      final List<ScheduleItem> items = const [],
      this.failure})
      : _items = items;

  @override
  @JsonKey()
  final StateStatus status;
  final List<ScheduleItem> _items;
  @override
  @JsonKey()
  List<ScheduleItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Failure? failure;

  /// Create a copy of ScheduleCarouselState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleCarouselStateCopyWith<_ScheduleCarouselState> get copyWith =>
      __$ScheduleCarouselStateCopyWithImpl<_ScheduleCarouselState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleCarouselState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_items), failure);

  @override
  String toString() {
    return 'ScheduleCarouselState(status: $status, items: $items, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleCarouselStateCopyWith<$Res>
    implements $ScheduleCarouselStateCopyWith<$Res> {
  factory _$ScheduleCarouselStateCopyWith(_ScheduleCarouselState value,
          $Res Function(_ScheduleCarouselState) _then) =
      __$ScheduleCarouselStateCopyWithImpl;
  @override
  @useResult
  $Res call({StateStatus status, List<ScheduleItem> items, Failure? failure});
}

/// @nodoc
class __$ScheduleCarouselStateCopyWithImpl<$Res>
    implements _$ScheduleCarouselStateCopyWith<$Res> {
  __$ScheduleCarouselStateCopyWithImpl(this._self, this._then);

  final _ScheduleCarouselState _self;
  final $Res Function(_ScheduleCarouselState) _then;

  /// Create a copy of ScheduleCarouselState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? failure = freezed,
  }) {
    return _then(_ScheduleCarouselState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScheduleItem>,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

// dart format on
