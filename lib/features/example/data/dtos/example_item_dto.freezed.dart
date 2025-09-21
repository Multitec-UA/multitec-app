// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExampleItemDto {

 String get id; String get title; String? get description;
/// Create a copy of ExampleItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleItemDtoCopyWith<ExampleItemDto> get copyWith => _$ExampleItemDtoCopyWithImpl<ExampleItemDto>(this as ExampleItemDto, _$identity);

  /// Serializes this ExampleItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description);

@override
String toString() {
  return 'ExampleItemDto(id: $id, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $ExampleItemDtoCopyWith<$Res>  {
  factory $ExampleItemDtoCopyWith(ExampleItemDto value, $Res Function(ExampleItemDto) _then) = _$ExampleItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description
});




}
/// @nodoc
class _$ExampleItemDtoCopyWithImpl<$Res>
    implements $ExampleItemDtoCopyWith<$Res> {
  _$ExampleItemDtoCopyWithImpl(this._self, this._then);

  final ExampleItemDto _self;
  final $Res Function(ExampleItemDto) _then;

/// Create a copy of ExampleItemDto
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


/// Adds pattern-matching-related methods to [ExampleItemDto].
extension ExampleItemDtoPatterns on ExampleItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ExampleItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleItemDto() when $default != null:
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
case _ExampleItemDto() when $default != null:
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
case _ExampleItemDto():
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
case _ExampleItemDto() when $default != null:
return $default(_that.id,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExampleItemDto extends ExampleItemDto {
  const _ExampleItemDto({required this.id, required this.title, this.description}): super._();
  factory _ExampleItemDto.fromJson(Map<String, dynamic> json) => _$ExampleItemDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;

/// Create a copy of ExampleItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleItemDtoCopyWith<_ExampleItemDto> get copyWith => __$ExampleItemDtoCopyWithImpl<_ExampleItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description);

@override
String toString() {
  return 'ExampleItemDto(id: $id, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ExampleItemDtoCopyWith<$Res> implements $ExampleItemDtoCopyWith<$Res> {
  factory _$ExampleItemDtoCopyWith(_ExampleItemDto value, $Res Function(_ExampleItemDto) _then) = __$ExampleItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description
});




}
/// @nodoc
class __$ExampleItemDtoCopyWithImpl<$Res>
    implements _$ExampleItemDtoCopyWith<$Res> {
  __$ExampleItemDtoCopyWithImpl(this._self, this._then);

  final _ExampleItemDto _self;
  final $Res Function(_ExampleItemDto) _then;

/// Create a copy of ExampleItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,}) {
  return _then(_ExampleItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
