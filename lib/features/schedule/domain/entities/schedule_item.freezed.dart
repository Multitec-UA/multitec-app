// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduleItem {

 String get id; String get type; String get title; String get description; DateTime get startsAt; bool get published; int get attendeesCount; DateTime get createdAt; DateTime get updatedAt; DateTime? get endsAt; String? get location; String? get imageUrl; String? get category;
/// Create a copy of ScheduleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleItemCopyWith<ScheduleItem> get copyWith => _$ScheduleItemCopyWithImpl<ScheduleItem>(this as ScheduleItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.published, published) || other.published == published)&&(identical(other.attendeesCount, attendeesCount) || other.attendeesCount == attendeesCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,title,description,startsAt,published,attendeesCount,createdAt,updatedAt,endsAt,location,imageUrl,category);

@override
String toString() {
  return 'ScheduleItem(id: $id, type: $type, title: $title, description: $description, startsAt: $startsAt, published: $published, attendeesCount: $attendeesCount, createdAt: $createdAt, updatedAt: $updatedAt, endsAt: $endsAt, location: $location, imageUrl: $imageUrl, category: $category)';
}


}

/// @nodoc
abstract mixin class $ScheduleItemCopyWith<$Res>  {
  factory $ScheduleItemCopyWith(ScheduleItem value, $Res Function(ScheduleItem) _then) = _$ScheduleItemCopyWithImpl;
@useResult
$Res call({
 String id, String type, String title, String description, DateTime startsAt, bool published, int attendeesCount, DateTime createdAt, DateTime updatedAt, DateTime? endsAt, String? location, String? imageUrl, String? category
});




}
/// @nodoc
class _$ScheduleItemCopyWithImpl<$Res>
    implements $ScheduleItemCopyWith<$Res> {
  _$ScheduleItemCopyWithImpl(this._self, this._then);

  final ScheduleItem _self;
  final $Res Function(ScheduleItem) _then;

/// Create a copy of ScheduleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? published = null,Object? attendeesCount = null,Object? createdAt = null,Object? updatedAt = null,Object? endsAt = freezed,Object? location = freezed,Object? imageUrl = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,published: null == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool,attendeesCount: null == attendeesCount ? _self.attendeesCount : attendeesCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleItem].
extension ScheduleItemPatterns on ScheduleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleItem value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleItem value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String description,  DateTime startsAt,  bool published,  int attendeesCount,  DateTime createdAt,  DateTime updatedAt,  DateTime? endsAt,  String? location,  String? imageUrl,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.startsAt,_that.published,_that.attendeesCount,_that.createdAt,_that.updatedAt,_that.endsAt,_that.location,_that.imageUrl,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String description,  DateTime startsAt,  bool published,  int attendeesCount,  DateTime createdAt,  DateTime updatedAt,  DateTime? endsAt,  String? location,  String? imageUrl,  String? category)  $default,) {final _that = this;
switch (_that) {
case _ScheduleItem():
return $default(_that.id,_that.type,_that.title,_that.description,_that.startsAt,_that.published,_that.attendeesCount,_that.createdAt,_that.updatedAt,_that.endsAt,_that.location,_that.imageUrl,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String title,  String description,  DateTime startsAt,  bool published,  int attendeesCount,  DateTime createdAt,  DateTime updatedAt,  DateTime? endsAt,  String? location,  String? imageUrl,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.startsAt,_that.published,_that.attendeesCount,_that.createdAt,_that.updatedAt,_that.endsAt,_that.location,_that.imageUrl,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleItem implements ScheduleItem {
  const _ScheduleItem({required this.id, required this.type, required this.title, required this.description, required this.startsAt, required this.published, required this.attendeesCount, required this.createdAt, required this.updatedAt, this.endsAt, this.location, this.imageUrl, this.category});
  

@override final  String id;
@override final  String type;
@override final  String title;
@override final  String description;
@override final  DateTime startsAt;
@override final  bool published;
@override final  int attendeesCount;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? endsAt;
@override final  String? location;
@override final  String? imageUrl;
@override final  String? category;

/// Create a copy of ScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleItemCopyWith<_ScheduleItem> get copyWith => __$ScheduleItemCopyWithImpl<_ScheduleItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.published, published) || other.published == published)&&(identical(other.attendeesCount, attendeesCount) || other.attendeesCount == attendeesCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,title,description,startsAt,published,attendeesCount,createdAt,updatedAt,endsAt,location,imageUrl,category);

@override
String toString() {
  return 'ScheduleItem(id: $id, type: $type, title: $title, description: $description, startsAt: $startsAt, published: $published, attendeesCount: $attendeesCount, createdAt: $createdAt, updatedAt: $updatedAt, endsAt: $endsAt, location: $location, imageUrl: $imageUrl, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ScheduleItemCopyWith<$Res> implements $ScheduleItemCopyWith<$Res> {
  factory _$ScheduleItemCopyWith(_ScheduleItem value, $Res Function(_ScheduleItem) _then) = __$ScheduleItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String title, String description, DateTime startsAt, bool published, int attendeesCount, DateTime createdAt, DateTime updatedAt, DateTime? endsAt, String? location, String? imageUrl, String? category
});




}
/// @nodoc
class __$ScheduleItemCopyWithImpl<$Res>
    implements _$ScheduleItemCopyWith<$Res> {
  __$ScheduleItemCopyWithImpl(this._self, this._then);

  final _ScheduleItem _self;
  final $Res Function(_ScheduleItem) _then;

/// Create a copy of ScheduleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? description = null,Object? startsAt = null,Object? published = null,Object? attendeesCount = null,Object? createdAt = null,Object? updatedAt = null,Object? endsAt = freezed,Object? location = freezed,Object? imageUrl = freezed,Object? category = freezed,}) {
  return _then(_ScheduleItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,published: null == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool,attendeesCount: null == attendeesCount ? _self.attendeesCount : attendeesCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
