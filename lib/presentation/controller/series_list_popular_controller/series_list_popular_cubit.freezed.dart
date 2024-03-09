// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_list_popular_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeriesListPopularState {
  RequestState get state => throw _privateConstructorUsedError;
  List<Series> get series => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeriesListPopularStateCopyWith<SeriesListPopularState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesListPopularStateCopyWith<$Res> {
  factory $SeriesListPopularStateCopyWith(SeriesListPopularState value,
          $Res Function(SeriesListPopularState) then) =
      _$SeriesListPopularStateCopyWithImpl<$Res, SeriesListPopularState>;
  @useResult
  $Res call({RequestState state, List<Series> series, String? message});
}

/// @nodoc
class _$SeriesListPopularStateCopyWithImpl<$Res,
        $Val extends SeriesListPopularState>
    implements $SeriesListPopularStateCopyWith<$Res> {
  _$SeriesListPopularStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? series = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<Series>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesListPopularStateImplCopyWith<$Res>
    implements $SeriesListPopularStateCopyWith<$Res> {
  factory _$$SeriesListPopularStateImplCopyWith(
          _$SeriesListPopularStateImpl value,
          $Res Function(_$SeriesListPopularStateImpl) then) =
      __$$SeriesListPopularStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, List<Series> series, String? message});
}

/// @nodoc
class __$$SeriesListPopularStateImplCopyWithImpl<$Res>
    extends _$SeriesListPopularStateCopyWithImpl<$Res,
        _$SeriesListPopularStateImpl>
    implements _$$SeriesListPopularStateImplCopyWith<$Res> {
  __$$SeriesListPopularStateImplCopyWithImpl(
      _$SeriesListPopularStateImpl _value,
      $Res Function(_$SeriesListPopularStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? series = null,
    Object? message = freezed,
  }) {
    return _then(_$SeriesListPopularStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      series: null == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<Series>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SeriesListPopularStateImpl implements _SeriesListPopularState {
  const _$SeriesListPopularStateImpl(
      {this.state = RequestState.empty,
      final List<Series> series = const [],
      this.message})
      : _series = series;

  @override
  @JsonKey()
  final RequestState state;
  final List<Series> _series;
  @override
  @JsonKey()
  List<Series> get series {
    if (_series is EqualUnmodifiableListView) return _series;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_series);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'SeriesListPopularState(state: $state, series: $series, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesListPopularStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state,
      const DeepCollectionEquality().hash(_series), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesListPopularStateImplCopyWith<_$SeriesListPopularStateImpl>
      get copyWith => __$$SeriesListPopularStateImplCopyWithImpl<
          _$SeriesListPopularStateImpl>(this, _$identity);
}

abstract class _SeriesListPopularState implements SeriesListPopularState {
  const factory _SeriesListPopularState(
      {final RequestState state,
      final List<Series> series,
      final String? message}) = _$SeriesListPopularStateImpl;

  @override
  RequestState get state;
  @override
  List<Series> get series;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$SeriesListPopularStateImplCopyWith<_$SeriesListPopularStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
