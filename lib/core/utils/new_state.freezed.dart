// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncValue<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValue<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncValue<$T>()';
}


}

/// @nodoc
class $AsyncValueCopyWith<T,$Res>  {
$AsyncValueCopyWith(AsyncValue<T> _, $Res Function(AsyncValue<T>) __);
}


/// Adds pattern-matching-related methods to [AsyncValue].
extension AsyncValuePatterns<T> on AsyncValue<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle<T> value)?  idle,TResult Function( _Loading<T> value)?  loading,TResult Function( _Data<T> value)?  data,TResult Function( _Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Loading() when loading != null:
return loading(_that);case _Data() when data != null:
return data(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle<T> value)  idle,required TResult Function( _Loading<T> value)  loading,required TResult Function( _Data<T> value)  data,required TResult Function( _Error<T> value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Loading():
return loading(_that);case _Data():
return data(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle<T> value)?  idle,TResult? Function( _Loading<T> value)?  loading,TResult? Function( _Data<T> value)?  data,TResult? Function( _Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Loading() when loading != null:
return loading(_that);case _Data() when data != null:
return data(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( T value,  bool refreshing,  Failure? refreshError)?  data,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Data() when data != null:
return data(_that.value,_that.refreshing,_that.refreshError);case _Error() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( T value,  bool refreshing,  Failure? refreshError)  data,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Loading():
return loading();case _Data():
return data(_that.value,_that.refreshing,_that.refreshError);case _Error():
return error(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( T value,  bool refreshing,  Failure? refreshError)?  data,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Data() when data != null:
return data(_that.value,_that.refreshing,_that.refreshError);case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Idle<T> implements AsyncValue<T> {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncValue<$T>.idle()';
}


}




/// @nodoc


class _Loading<T> implements AsyncValue<T> {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncValue<$T>.loading()';
}


}




/// @nodoc


class _Data<T> implements AsyncValue<T> {
  const _Data(this.value, {this.refreshing = false, this.refreshError});
  

 final  T value;
@JsonKey() final  bool refreshing;
 final  Failure? refreshError;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<T, _Data<T>> get copyWith => __$DataCopyWithImpl<T, _Data<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data<T>&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.refreshing, refreshing) || other.refreshing == refreshing)&&(identical(other.refreshError, refreshError) || other.refreshError == refreshError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value),refreshing,refreshError);

@override
String toString() {
  return 'AsyncValue<$T>.data(value: $value, refreshing: $refreshing, refreshError: $refreshError)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<T,$Res> implements $AsyncValueCopyWith<T, $Res> {
  factory _$DataCopyWith(_Data<T> value, $Res Function(_Data<T>) _then) = __$DataCopyWithImpl;
@useResult
$Res call({
 T value, bool refreshing, Failure? refreshError
});




}
/// @nodoc
class __$DataCopyWithImpl<T,$Res>
    implements _$DataCopyWith<T, $Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data<T> _self;
  final $Res Function(_Data<T>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? refreshing = null,Object? refreshError = freezed,}) {
  return _then(_Data<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,refreshing: null == refreshing ? _self.refreshing : refreshing // ignore: cast_nullable_to_non_nullable
as bool,refreshError: freezed == refreshError ? _self.refreshError : refreshError // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class _Error<T> implements AsyncValue<T> {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, _Error<T>> get copyWith => __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AsyncValue<$T>.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,$Res> implements $AsyncValueCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,$Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
