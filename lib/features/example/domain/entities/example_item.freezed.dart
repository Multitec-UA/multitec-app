// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExampleItem {

 String get id; String get title; String? get description;
/// Create a copy of ExampleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleItemCopyWith<ExampleItem> get copyWith => _$ExampleItemCopyWithImpl<ExampleItem>(this as ExampleItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description);

@override
String toString() {
  return 'ExampleItem(id: $id, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $ExampleItemCopyWith<$Res>  {
  factory $ExampleItemCopyWith(ExampleItem value, $Res Function(ExampleItem) _then) = _$ExampleItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description
});




}
/// @nodoc
class _$ExampleItemCopyWithImpl<$Res>
    implements $ExampleItemCopyWith<$Res> {
  _$ExampleItemCopyWithImpl(this._self, this._then);

  final ExampleItem _self;
  final $Res Function(ExampleItem) _then;

/// Create a copy of ExampleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExampleItem].
extension ExampleItemPatterns on ExampleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleItem value)  $default,){
final _that = this;
switch (_that) {
case _ExampleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleItem value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExampleItem() when $default != null:
return $default(_that.id,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description)  $default,) {final _that = this;
switch (_that) {
case _ExampleItem():
return $default(_that.id,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _ExampleItem() when $default != null:
return $default(_that.id,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _ExampleItem implements ExampleItem {
  const _ExampleItem({required this.id, required this.title, this.description});
  

@override final  String id;
@override final  String title;
@override final  String? description;

/// Create a copy of ExampleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleItemCopyWith<_ExampleItem> get copyWith => __$ExampleItemCopyWithImpl<_ExampleItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description);

@override
String toString() {
  return 'ExampleItem(id: $id, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ExampleItemCopyWith<$Res> implements $ExampleItemCopyWith<$Res> {
  factory _$ExampleItemCopyWith(_ExampleItem value, $Res Function(_ExampleItem) _then) = __$ExampleItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description
});




}
/// @nodoc
class __$ExampleItemCopyWithImpl<$Res>
    implements _$ExampleItemCopyWith<$Res> {
  __$ExampleItemCopyWithImpl(this._self, this._then);

  final _ExampleItem _self;
  final $Res Function(_ExampleItem) _then;

/// Create a copy of ExampleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,}) {
  return _then(_ExampleItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
