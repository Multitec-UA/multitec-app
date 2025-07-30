// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CitySearchState {
  CitySearchStatus get status;
  List<City> get cities;
  PaginationMeta get meta;
  String get query;
  String? get message;

  /// Create a copy of CitySearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CitySearchStateCopyWith<CitySearchState> get copyWith =>
      _$CitySearchStateCopyWithImpl<CitySearchState>(
          this as CitySearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CitySearchState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.cities, cities) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(cities), meta, query, message);

  @override
  String toString() {
    return 'CitySearchState(status: $status, cities: $cities, meta: $meta, query: $query, message: $message)';
  }
}

/// @nodoc
abstract mixin class $CitySearchStateCopyWith<$Res> {
  factory $CitySearchStateCopyWith(
          CitySearchState value, $Res Function(CitySearchState) _then) =
      _$CitySearchStateCopyWithImpl;
  @useResult
  $Res call(
      {CitySearchStatus status,
      List<City> cities,
      PaginationMeta meta,
      String query,
      String? message});
}

/// @nodoc
class _$CitySearchStateCopyWithImpl<$Res>
    implements $CitySearchStateCopyWith<$Res> {
  _$CitySearchStateCopyWithImpl(this._self, this._then);

  final CitySearchState _self;
  final $Res Function(CitySearchState) _then;

  /// Create a copy of CitySearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cities = null,
    Object? meta = null,
    Object? query = null,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CitySearchStatus,
      cities: null == cities
          ? _self.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _CitySearchState implements CitySearchState {
  const _CitySearchState(
      {required this.status,
      final List<City> cities = const [],
      this.meta = const PaginationMeta(),
      this.query = '',
      this.message})
      : _cities = cities;

  @override
  final CitySearchStatus status;
  final List<City> _cities;
  @override
  @JsonKey()
  List<City> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  @JsonKey()
  final PaginationMeta meta;
  @override
  @JsonKey()
  final String query;
  @override
  final String? message;

  /// Create a copy of CitySearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CitySearchStateCopyWith<_CitySearchState> get copyWith =>
      __$CitySearchStateCopyWithImpl<_CitySearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CitySearchState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_cities), meta, query, message);

  @override
  String toString() {
    return 'CitySearchState(status: $status, cities: $cities, meta: $meta, query: $query, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$CitySearchStateCopyWith<$Res>
    implements $CitySearchStateCopyWith<$Res> {
  factory _$CitySearchStateCopyWith(
          _CitySearchState value, $Res Function(_CitySearchState) _then) =
      __$CitySearchStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CitySearchStatus status,
      List<City> cities,
      PaginationMeta meta,
      String query,
      String? message});
}

/// @nodoc
class __$CitySearchStateCopyWithImpl<$Res>
    implements _$CitySearchStateCopyWith<$Res> {
  __$CitySearchStateCopyWithImpl(this._self, this._then);

  final _CitySearchState _self;
  final $Res Function(_CitySearchState) _then;

  /// Create a copy of CitySearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? cities = null,
    Object? meta = null,
    Object? query = null,
    Object? message = freezed,
  }) {
    return _then(_CitySearchState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CitySearchStatus,
      cities: null == cities
          ? _self._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
