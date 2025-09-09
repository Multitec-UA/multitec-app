// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleState {
  List<ScheduleItem> get items;
  StateStatus get listStatus;
  Failure? get listFailure;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleStateCopyWith<ScheduleState> get copyWith =>
      _$ScheduleStateCopyWithImpl<ScheduleState>(
          this as ScheduleState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.listStatus, listStatus) ||
                other.listStatus == listStatus) &&
            (identical(other.listFailure, listFailure) ||
                other.listFailure == listFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), listStatus, listFailure);

  @override
  String toString() {
    return 'ScheduleState(items: $items, listStatus: $listStatus, listFailure: $listFailure)';
  }
}

/// @nodoc
abstract mixin class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) _then) =
      _$ScheduleStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ScheduleItem> items, StateStatus listStatus, Failure? listFailure});
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._self, this._then);

  final ScheduleState _self;
  final $Res Function(ScheduleState) _then;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? listStatus = null,
    Object? listFailure = freezed,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScheduleItem>,
      listStatus: null == listStatus
          ? _self.listStatus
          : listStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      listFailure: freezed == listFailure
          ? _self.listFailure
          : listFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScheduleState].
extension ScheduleStatePatterns on ScheduleState {
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
    TResult Function(_ScheduleState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleState() when $default != null:
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
    TResult Function(_ScheduleState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleState():
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
    TResult? Function(_ScheduleState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleState() when $default != null:
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
    TResult Function(List<ScheduleItem> items, StateStatus listStatus,
            Failure? listFailure)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleState() when $default != null:
        return $default(_that.items, _that.listStatus, _that.listFailure);
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
    TResult Function(List<ScheduleItem> items, StateStatus listStatus,
            Failure? listFailure)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleState():
        return $default(_that.items, _that.listStatus, _that.listFailure);
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
    TResult? Function(List<ScheduleItem> items, StateStatus listStatus,
            Failure? listFailure)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleState() when $default != null:
        return $default(_that.items, _that.listStatus, _that.listFailure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScheduleState implements ScheduleState {
  const _ScheduleState(
      {final List<ScheduleItem> items = const <ScheduleItem>[],
      this.listStatus = StateStatus.initial,
      this.listFailure})
      : _items = items;

  final List<ScheduleItem> _items;
  @override
  @JsonKey()
  List<ScheduleItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final StateStatus listStatus;
  @override
  final Failure? listFailure;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleStateCopyWith<_ScheduleState> get copyWith =>
      __$ScheduleStateCopyWithImpl<_ScheduleState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.listStatus, listStatus) ||
                other.listStatus == listStatus) &&
            (identical(other.listFailure, listFailure) ||
                other.listFailure == listFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), listStatus, listFailure);

  @override
  String toString() {
    return 'ScheduleState(items: $items, listStatus: $listStatus, listFailure: $listFailure)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleStateCopyWith<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  factory _$ScheduleStateCopyWith(
          _ScheduleState value, $Res Function(_ScheduleState) _then) =
      __$ScheduleStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ScheduleItem> items, StateStatus listStatus, Failure? listFailure});
}

/// @nodoc
class __$ScheduleStateCopyWithImpl<$Res>
    implements _$ScheduleStateCopyWith<$Res> {
  __$ScheduleStateCopyWithImpl(this._self, this._then);

  final _ScheduleState _self;
  final $Res Function(_ScheduleState) _then;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? listStatus = null,
    Object? listFailure = freezed,
  }) {
    return _then(_ScheduleState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ScheduleItem>,
      listStatus: null == listStatus
          ? _self.listStatus
          : listStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      listFailure: freezed == listFailure
          ? _self.listFailure
          : listFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

// dart format on
