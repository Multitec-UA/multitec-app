// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationParams {

 String? get cursor; int get limit;
/// Create a copy of PaginationParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationParamsCopyWith<PaginationParams> get copyWith => _$PaginationParamsCopyWithImpl<PaginationParams>(this as PaginationParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationParams&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,cursor,limit);

@override
String toString() {
  return 'PaginationParams(cursor: $cursor, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $PaginationParamsCopyWith<$Res>  {
  factory $PaginationParamsCopyWith(PaginationParams value, $Res Function(PaginationParams) _then) = _$PaginationParamsCopyWithImpl;
@useResult
$Res call({
 String? cursor, int limit
});




}
/// @nodoc
class _$PaginationParamsCopyWithImpl<$Res>
    implements $PaginationParamsCopyWith<$Res> {
  _$PaginationParamsCopyWithImpl(this._self, this._then);

  final PaginationParams _self;
  final $Res Function(PaginationParams) _then;

/// Create a copy of PaginationParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cursor = freezed,Object? limit = null,}) {
  return _then(_self.copyWith(
cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationParams].
extension PaginationParamsPatterns on PaginationParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationParams value)  $default,){
final _that = this;
switch (_that) {
case _PaginationParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationParams value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cursor,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationParams() when $default != null:
return $default(_that.cursor,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cursor,  int limit)  $default,) {final _that = this;
switch (_that) {
case _PaginationParams():
return $default(_that.cursor,_that.limit);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cursor,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _PaginationParams() when $default != null:
return $default(_that.cursor,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationParams implements PaginationParams {
  const _PaginationParams({this.cursor, this.limit = 20});
  

@override final  String? cursor;
@override@JsonKey() final  int limit;

/// Create a copy of PaginationParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationParamsCopyWith<_PaginationParams> get copyWith => __$PaginationParamsCopyWithImpl<_PaginationParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationParams&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,cursor,limit);

@override
String toString() {
  return 'PaginationParams(cursor: $cursor, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$PaginationParamsCopyWith<$Res> implements $PaginationParamsCopyWith<$Res> {
  factory _$PaginationParamsCopyWith(_PaginationParams value, $Res Function(_PaginationParams) _then) = __$PaginationParamsCopyWithImpl;
@override @useResult
$Res call({
 String? cursor, int limit
});




}
/// @nodoc
class __$PaginationParamsCopyWithImpl<$Res>
    implements _$PaginationParamsCopyWith<$Res> {
  __$PaginationParamsCopyWithImpl(this._self, this._then);

  final _PaginationParams _self;
  final $Res Function(_PaginationParams) _then;

/// Create a copy of PaginationParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cursor = freezed,Object? limit = null,}) {
  return _then(_PaginationParams(
cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
