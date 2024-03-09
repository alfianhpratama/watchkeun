// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_series_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WatchlistSeriesState {
  RequestState get watchlistState => throw _privateConstructorUsedError;
  List<Series> get watchlistSeries => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WatchlistSeriesStateCopyWith<WatchlistSeriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistSeriesStateCopyWith<$Res> {
  factory $WatchlistSeriesStateCopyWith(WatchlistSeriesState value,
          $Res Function(WatchlistSeriesState) then) =
      _$WatchlistSeriesStateCopyWithImpl<$Res, WatchlistSeriesState>;
  @useResult
  $Res call(
      {RequestState watchlistState,
      List<Series> watchlistSeries,
      String? message});
}

/// @nodoc
class _$WatchlistSeriesStateCopyWithImpl<$Res,
        $Val extends WatchlistSeriesState>
    implements $WatchlistSeriesStateCopyWith<$Res> {
  _$WatchlistSeriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlistState = null,
    Object? watchlistSeries = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      watchlistState: null == watchlistState
          ? _value.watchlistState
          : watchlistState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      watchlistSeries: null == watchlistSeries
          ? _value.watchlistSeries
          : watchlistSeries // ignore: cast_nullable_to_non_nullable
              as List<Series>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistSeriesStateImplCopyWith<$Res>
    implements $WatchlistSeriesStateCopyWith<$Res> {
  factory _$$WatchlistSeriesStateImplCopyWith(_$WatchlistSeriesStateImpl value,
          $Res Function(_$WatchlistSeriesStateImpl) then) =
      __$$WatchlistSeriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState watchlistState,
      List<Series> watchlistSeries,
      String? message});
}

/// @nodoc
class __$$WatchlistSeriesStateImplCopyWithImpl<$Res>
    extends _$WatchlistSeriesStateCopyWithImpl<$Res, _$WatchlistSeriesStateImpl>
    implements _$$WatchlistSeriesStateImplCopyWith<$Res> {
  __$$WatchlistSeriesStateImplCopyWithImpl(_$WatchlistSeriesStateImpl _value,
      $Res Function(_$WatchlistSeriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlistState = null,
    Object? watchlistSeries = null,
    Object? message = freezed,
  }) {
    return _then(_$WatchlistSeriesStateImpl(
      watchlistState: null == watchlistState
          ? _value.watchlistState
          : watchlistState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      watchlistSeries: null == watchlistSeries
          ? _value._watchlistSeries
          : watchlistSeries // ignore: cast_nullable_to_non_nullable
              as List<Series>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WatchlistSeriesStateImpl implements _WatchlistSeriesState {
  const _$WatchlistSeriesStateImpl(
      {this.watchlistState = RequestState.empty,
      final List<Series> watchlistSeries = const [],
      this.message})
      : _watchlistSeries = watchlistSeries;

  @override
  @JsonKey()
  final RequestState watchlistState;
  final List<Series> _watchlistSeries;
  @override
  @JsonKey()
  List<Series> get watchlistSeries {
    if (_watchlistSeries is EqualUnmodifiableListView) return _watchlistSeries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_watchlistSeries);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'WatchlistSeriesState(watchlistState: $watchlistState, watchlistSeries: $watchlistSeries, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistSeriesStateImpl &&
            (identical(other.watchlistState, watchlistState) ||
                other.watchlistState == watchlistState) &&
            const DeepCollectionEquality()
                .equals(other._watchlistSeries, _watchlistSeries) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, watchlistState,
      const DeepCollectionEquality().hash(_watchlistSeries), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistSeriesStateImplCopyWith<_$WatchlistSeriesStateImpl>
      get copyWith =>
          __$$WatchlistSeriesStateImplCopyWithImpl<_$WatchlistSeriesStateImpl>(
              this, _$identity);
}

abstract class _WatchlistSeriesState implements WatchlistSeriesState {
  const factory _WatchlistSeriesState(
      {final RequestState watchlistState,
      final List<Series> watchlistSeries,
      final String? message}) = _$WatchlistSeriesStateImpl;

  @override
  RequestState get watchlistState;
  @override
  List<Series> get watchlistSeries;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$WatchlistSeriesStateImplCopyWith<_$WatchlistSeriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
