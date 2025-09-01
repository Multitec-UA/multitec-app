// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExampleState {
  List<ExampleItem> get items;
  StateStatus get listStatus;
  StateStatus get reportStatus;
  Failure? get listFailure;
  Failure? get reportFailure;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExampleStateCopyWith<ExampleState> get copyWith =>
      _$ExampleStateCopyWithImpl<ExampleState>(
          this as ExampleState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExampleState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.listStatus, listStatus) ||
                other.listStatus == listStatus) &&
            (identical(other.reportStatus, reportStatus) ||
                other.reportStatus == reportStatus) &&
            (identical(other.listFailure, listFailure) ||
                other.listFailure == listFailure) &&
            (identical(other.reportFailure, reportFailure) ||
                other.reportFailure == reportFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      listStatus,
      reportStatus,
      listFailure,
      reportFailure);

  @override
  String toString() {
    return 'ExampleState(items: $items, listStatus: $listStatus, reportStatus: $reportStatus, listFailure: $listFailure, reportFailure: $reportFailure)';
  }
}

/// @nodoc
abstract mixin class $ExampleStateCopyWith<$Res> {
  factory $ExampleStateCopyWith(
          ExampleState value, $Res Function(ExampleState) _then) =
      _$ExampleStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ExampleItem> items,
      StateStatus listStatus,
      StateStatus reportStatus,
      Failure? listFailure,
      Failure? reportFailure});
}

/// @nodoc
class _$ExampleStateCopyWithImpl<$Res> implements $ExampleStateCopyWith<$Res> {
  _$ExampleStateCopyWithImpl(this._self, this._then);

  final ExampleState _self;
  final $Res Function(ExampleState) _then;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? listStatus = null,
    Object? reportStatus = null,
    Object? listFailure = freezed,
    Object? reportFailure = freezed,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ExampleItem>,
      listStatus: null == listStatus
          ? _self.listStatus
          : listStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      reportStatus: null == reportStatus
          ? _self.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      listFailure: freezed == listFailure
          ? _self.listFailure
          : listFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      reportFailure: freezed == reportFailure
          ? _self.reportFailure
          : reportFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExampleState].
extension ExampleStatePatterns on ExampleState {
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
    TResult Function(_ExampleState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExampleState() when $default != null:
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
    TResult Function(_ExampleState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleState():
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
    TResult? Function(_ExampleState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleState() when $default != null:
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
            List<ExampleItem> items,
            StateStatus listStatus,
            StateStatus reportStatus,
            Failure? listFailure,
            Failure? reportFailure)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExampleState() when $default != null:
        return $default(_that.items, _that.listStatus, _that.reportStatus,
            _that.listFailure, _that.reportFailure);
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
            List<ExampleItem> items,
            StateStatus listStatus,
            StateStatus reportStatus,
            Failure? listFailure,
            Failure? reportFailure)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleState():
        return $default(_that.items, _that.listStatus, _that.reportStatus,
            _that.listFailure, _that.reportFailure);
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
            List<ExampleItem> items,
            StateStatus listStatus,
            StateStatus reportStatus,
            Failure? listFailure,
            Failure? reportFailure)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleState() when $default != null:
        return $default(_that.items, _that.listStatus, _that.reportStatus,
            _that.listFailure, _that.reportFailure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExampleState implements ExampleState {
  const _ExampleState(
      {final List<ExampleItem> items = const <ExampleItem>[],
      this.listStatus = StateStatus.initial,
      this.reportStatus = StateStatus.initial,
      this.listFailure,
      this.reportFailure})
      : _items = items;

  final List<ExampleItem> _items;
  @override
  @JsonKey()
  List<ExampleItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final StateStatus listStatus;
  @override
  @JsonKey()
  final StateStatus reportStatus;
  @override
  final Failure? listFailure;
  @override
  final Failure? reportFailure;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExampleStateCopyWith<_ExampleState> get copyWith =>
      __$ExampleStateCopyWithImpl<_ExampleState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExampleState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.listStatus, listStatus) ||
                other.listStatus == listStatus) &&
            (identical(other.reportStatus, reportStatus) ||
                other.reportStatus == reportStatus) &&
            (identical(other.listFailure, listFailure) ||
                other.listFailure == listFailure) &&
            (identical(other.reportFailure, reportFailure) ||
                other.reportFailure == reportFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      listStatus,
      reportStatus,
      listFailure,
      reportFailure);

  @override
  String toString() {
    return 'ExampleState(items: $items, listStatus: $listStatus, reportStatus: $reportStatus, listFailure: $listFailure, reportFailure: $reportFailure)';
  }
}

/// @nodoc
abstract mixin class _$ExampleStateCopyWith<$Res>
    implements $ExampleStateCopyWith<$Res> {
  factory _$ExampleStateCopyWith(
          _ExampleState value, $Res Function(_ExampleState) _then) =
      __$ExampleStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ExampleItem> items,
      StateStatus listStatus,
      StateStatus reportStatus,
      Failure? listFailure,
      Failure? reportFailure});
}

/// @nodoc
class __$ExampleStateCopyWithImpl<$Res>
    implements _$ExampleStateCopyWith<$Res> {
  __$ExampleStateCopyWithImpl(this._self, this._then);

  final _ExampleState _self;
  final $Res Function(_ExampleState) _then;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? listStatus = null,
    Object? reportStatus = null,
    Object? listFailure = freezed,
    Object? reportFailure = freezed,
  }) {
    return _then(_ExampleState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ExampleItem>,
      listStatus: null == listStatus
          ? _self.listStatus
          : listStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      reportStatus: null == reportStatus
          ? _self.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      listFailure: freezed == listFailure
          ? _self.listFailure
          : listFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      reportFailure: freezed == reportFailure
          ? _self.reportFailure
          : reportFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

// dart format on
