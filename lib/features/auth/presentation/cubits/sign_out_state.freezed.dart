// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_out_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignOutState {

 RequestStatus get status; Failure? get failure;
/// Create a copy of SignOutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignOutStateCopyWith<SignOutState> get copyWith => _$SignOutStateCopyWithImpl<SignOutState>(this as SignOutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignOutState&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,failure);

@override
String toString() {
  return 'SignOutState(status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SignOutStateCopyWith<$Res>  {
  factory $SignOutStateCopyWith(SignOutState value, $Res Function(SignOutState) _then) = _$SignOutStateCopyWithImpl;
@useResult
$Res call({
 RequestStatus status, Failure? failure
});




}
/// @nodoc
class _$SignOutStateCopyWithImpl<$Res>
    implements $SignOutStateCopyWith<$Res> {
  _$SignOutStateCopyWithImpl(this._self, this._then);

  final SignOutState _self;
  final $Res Function(SignOutState) _then;

/// Create a copy of SignOutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignOutState].
extension SignOutStatePatterns on SignOutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignOutState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignOutState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignOutState value)  $default,){
final _that = this;
switch (_that) {
case _SignOutState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignOutState value)?  $default,){
final _that = this;
switch (_that) {
case _SignOutState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestStatus status,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignOutState() when $default != null:
return $default(_that.status,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestStatus status,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _SignOutState():
return $default(_that.status,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestStatus status,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _SignOutState() when $default != null:
return $default(_that.status,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SignOutState implements SignOutState {
  const _SignOutState({this.status = RequestStatus.initial, this.failure});
  

@override@JsonKey() final  RequestStatus status;
@override final  Failure? failure;

/// Create a copy of SignOutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignOutStateCopyWith<_SignOutState> get copyWith => __$SignOutStateCopyWithImpl<_SignOutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignOutState&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,failure);

@override
String toString() {
  return 'SignOutState(status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SignOutStateCopyWith<$Res> implements $SignOutStateCopyWith<$Res> {
  factory _$SignOutStateCopyWith(_SignOutState value, $Res Function(_SignOutState) _then) = __$SignOutStateCopyWithImpl;
@override @useResult
$Res call({
 RequestStatus status, Failure? failure
});




}
/// @nodoc
class __$SignOutStateCopyWithImpl<$Res>
    implements _$SignOutStateCopyWith<$Res> {
  __$SignOutStateCopyWithImpl(this._self, this._then);

  final _SignOutState _self;
  final $Res Function(_SignOutState) _then;

/// Create a copy of SignOutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? failure = freezed,}) {
  return _then(_SignOutState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
