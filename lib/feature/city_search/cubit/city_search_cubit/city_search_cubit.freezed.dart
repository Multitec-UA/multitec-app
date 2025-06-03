// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CitySearchState {
  CitySearchStatus get status => throw _privateConstructorUsedError;
  List<City> get cities => throw _privateConstructorUsedError;
  PaginationMeta get meta => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of CitySearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CitySearchStateCopyWith<CitySearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitySearchStateCopyWith<$Res> {
  factory $CitySearchStateCopyWith(
          CitySearchState value, $Res Function(CitySearchState) then) =
      _$CitySearchStateCopyWithImpl<$Res, CitySearchState>;
  @useResult
  $Res call(
      {CitySearchStatus status,
      List<City> cities,
      PaginationMeta meta,
      String query,
      String? message});
}

/// @nodoc
class _$CitySearchStateCopyWithImpl<$Res, $Val extends CitySearchState>
    implements $CitySearchStateCopyWith<$Res> {
  _$CitySearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CitySearchStatus,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CitySearchStateImplCopyWith<$Res>
    implements $CitySearchStateCopyWith<$Res> {
  factory _$$CitySearchStateImplCopyWith(_$CitySearchStateImpl value,
          $Res Function(_$CitySearchStateImpl) then) =
      __$$CitySearchStateImplCopyWithImpl<$Res>;
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
class __$$CitySearchStateImplCopyWithImpl<$Res>
    extends _$CitySearchStateCopyWithImpl<$Res, _$CitySearchStateImpl>
    implements _$$CitySearchStateImplCopyWith<$Res> {
  __$$CitySearchStateImplCopyWithImpl(
      _$CitySearchStateImpl _value, $Res Function(_$CitySearchStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$CitySearchStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CitySearchStatus,
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CitySearchStateImpl implements _CitySearchState {
  const _$CitySearchStateImpl(
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

  @override
  String toString() {
    return 'CitySearchState(status: $status, cities: $cities, meta: $meta, query: $query, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitySearchStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_cities), meta, query, message);

  /// Create a copy of CitySearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CitySearchStateImplCopyWith<_$CitySearchStateImpl> get copyWith =>
      __$$CitySearchStateImplCopyWithImpl<_$CitySearchStateImpl>(
          this, _$identity);
}

abstract class _CitySearchState implements CitySearchState {
  const factory _CitySearchState(
      {required final CitySearchStatus status,
      final List<City> cities,
      final PaginationMeta meta,
      final String query,
      final String? message}) = _$CitySearchStateImpl;

  @override
  CitySearchStatus get status;
  @override
  List<City> get cities;
  @override
  PaginationMeta get meta;
  @override
  String get query;
  @override
  String? get message;

  /// Create a copy of CitySearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CitySearchStateImplCopyWith<_$CitySearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
