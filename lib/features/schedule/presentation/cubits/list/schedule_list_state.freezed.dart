// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduleListState {

 List<ScheduleItem> get items; RequestStatus get status; bool get hasMore; Failure? get failure;
/// Create a copy of ScheduleListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleListStateCopyWith<ScheduleListState> get copyWith => _$ScheduleListStateCopyWithImpl<ScheduleListState>(this as ScheduleListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),status,hasMore,failure);

@override
String toString() {
  return 'ScheduleListState(items: $items, status: $status, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ScheduleListStateCopyWith<$Res>  {
  factory $ScheduleListStateCopyWith(ScheduleListState value, $Res Function(ScheduleListState) _then) = _$ScheduleListStateCopyWithImpl;
@useResult
$Res call({
 List<ScheduleItem> items, RequestStatus status, bool hasMore, Failure? failure
});




}
/// @nodoc
class _$ScheduleListStateCopyWithImpl<$Res>
    implements $ScheduleListStateCopyWith<$Res> {
  _$ScheduleListStateCopyWithImpl(this._self, this._then);

  final ScheduleListState _self;
  final $Res Function(ScheduleListState) _then;

/// Create a copy of ScheduleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? status = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ScheduleItem>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleListState].
extension ScheduleListStatePatterns on ScheduleListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleListState value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleListState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleListState value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleListState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ScheduleItem> items,  RequestStatus status,  bool hasMore,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleListState() when $default != null:
return $default(_that.items,_that.status,_that.hasMore,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ScheduleItem> items,  RequestStatus status,  bool hasMore,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _ScheduleListState():
return $default(_that.items,_that.status,_that.hasMore,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ScheduleItem> items,  RequestStatus status,  bool hasMore,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleListState() when $default != null:
return $default(_that.items,_that.status,_that.hasMore,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleListState implements ScheduleListState {
  const _ScheduleListState({final  List<ScheduleItem> items = const <ScheduleItem>[], this.status = RequestStatus.initial, this.hasMore = true, this.failure}): _items = items;
  

 final  List<ScheduleItem> _items;
@override@JsonKey() List<ScheduleItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  RequestStatus status;
@override@JsonKey() final  bool hasMore;
@override final  Failure? failure;

/// Create a copy of ScheduleListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleListStateCopyWith<_ScheduleListState> get copyWith => __$ScheduleListStateCopyWithImpl<_ScheduleListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),status,hasMore,failure);

@override
String toString() {
  return 'ScheduleListState(items: $items, status: $status, hasMore: $hasMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ScheduleListStateCopyWith<$Res> implements $ScheduleListStateCopyWith<$Res> {
  factory _$ScheduleListStateCopyWith(_ScheduleListState value, $Res Function(_ScheduleListState) _then) = __$ScheduleListStateCopyWithImpl;
@override @useResult
$Res call({
 List<ScheduleItem> items, RequestStatus status, bool hasMore, Failure? failure
});




}
/// @nodoc
class __$ScheduleListStateCopyWithImpl<$Res>
    implements _$ScheduleListStateCopyWith<$Res> {
  __$ScheduleListStateCopyWithImpl(this._self, this._then);

  final _ScheduleListState _self;
  final $Res Function(_ScheduleListState) _then;

/// Create a copy of ScheduleListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? status = null,Object? hasMore = null,Object? failure = freezed,}) {
  return _then(_ScheduleListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ScheduleItem>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
