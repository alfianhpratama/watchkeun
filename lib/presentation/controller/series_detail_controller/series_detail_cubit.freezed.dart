// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeriesDetailState {
  RequestState get seriesState => throw _privateConstructorUsedError;
  RequestState get recommendationState => throw _privateConstructorUsedError;
  List<Series> get seriesRecommendations => throw _privateConstructorUsedError;
  bool get isAddedToWatchlist => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get watchlistMessage => throw _privateConstructorUsedError;
  SeriesDetail? get series => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeriesDetailStateCopyWith<SeriesDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesDetailStateCopyWith<$Res> {
  factory $SeriesDetailStateCopyWith(
          SeriesDetailState value, $Res Function(SeriesDetailState) then) =
      _$SeriesDetailStateCopyWithImpl<$Res, SeriesDetailState>;
  @useResult
  $Res call(
      {RequestState seriesState,
      RequestState recommendationState,
      List<Series> seriesRecommendations,
      bool isAddedToWatchlist,
      String? message,
      String? watchlistMessage,
      SeriesDetail? series});
}

/// @nodoc
class _$SeriesDetailStateCopyWithImpl<$Res, $Val extends SeriesDetailState>
    implements $SeriesDetailStateCopyWith<$Res> {
  _$SeriesDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriesState = null,
    Object? recommendationState = null,
    Object? seriesRecommendations = null,
    Object? isAddedToWatchlist = null,
    Object? message = freezed,
    Object? watchlistMessage = freezed,
    Object? series = freezed,
  }) {
    return _then(_value.copyWith(
      seriesState: null == seriesState
          ? _value.seriesState
          : seriesState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      recommendationState: null == recommendationState
          ? _value.recommendationState
          : recommendationState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      seriesRecommendations: null == seriesRecommendations
          ? _value.seriesRecommendations
          : seriesRecommendations // ignore: cast_nullable_to_non_nullable
              as List<Series>,
      isAddedToWatchlist: null == isAddedToWatchlist
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      watchlistMessage: freezed == watchlistMessage
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as SeriesDetail?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesDetailStateImplCopyWith<$Res>
    implements $SeriesDetailStateCopyWith<$Res> {
  factory _$$SeriesDetailStateImplCopyWith(_$SeriesDetailStateImpl value,
          $Res Function(_$SeriesDetailStateImpl) then) =
      __$$SeriesDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState seriesState,
      RequestState recommendationState,
      List<Series> seriesRecommendations,
      bool isAddedToWatchlist,
      String? message,
      String? watchlistMessage,
      SeriesDetail? series});
}

/// @nodoc
class __$$SeriesDetailStateImplCopyWithImpl<$Res>
    extends _$SeriesDetailStateCopyWithImpl<$Res, _$SeriesDetailStateImpl>
    implements _$$SeriesDetailStateImplCopyWith<$Res> {
  __$$SeriesDetailStateImplCopyWithImpl(_$SeriesDetailStateImpl _value,
      $Res Function(_$SeriesDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seriesState = null,
    Object? recommendationState = null,
    Object? seriesRecommendations = null,
    Object? isAddedToWatchlist = null,
    Object? message = freezed,
    Object? watchlistMessage = freezed,
    Object? series = freezed,
  }) {
    return _then(_$SeriesDetailStateImpl(
      seriesState: null == seriesState
          ? _value.seriesState
          : seriesState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      recommendationState: null == recommendationState
          ? _value.recommendationState
          : recommendationState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      seriesRecommendations: null == seriesRecommendations
          ? _value._seriesRecommendations
          : seriesRecommendations // ignore: cast_nullable_to_non_nullable
              as List<Series>,
      isAddedToWatchlist: null == isAddedToWatchlist
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      watchlistMessage: freezed == watchlistMessage
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as SeriesDetail?,
    ));
  }
}

/// @nodoc

class _$SeriesDetailStateImpl implements _SeriesDetailState {
  const _$SeriesDetailStateImpl(
      {this.seriesState = RequestState.empty,
      this.recommendationState = RequestState.empty,
      final List<Series> seriesRecommendations = const [],
      this.isAddedToWatchlist = false,
      this.message,
      this.watchlistMessage,
      this.series})
      : _seriesRecommendations = seriesRecommendations;

  @override
  @JsonKey()
  final RequestState seriesState;
  @override
  @JsonKey()
  final RequestState recommendationState;
  final List<Series> _seriesRecommendations;
  @override
  @JsonKey()
  List<Series> get seriesRecommendations {
    if (_seriesRecommendations is EqualUnmodifiableListView)
      return _seriesRecommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seriesRecommendations);
  }

  @override
  @JsonKey()
  final bool isAddedToWatchlist;
  @override
  final String? message;
  @override
  final String? watchlistMessage;
  @override
  final SeriesDetail? series;

  @override
  String toString() {
    return 'SeriesDetailState(seriesState: $seriesState, recommendationState: $recommendationState, seriesRecommendations: $seriesRecommendations, isAddedToWatchlist: $isAddedToWatchlist, message: $message, watchlistMessage: $watchlistMessage, series: $series)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesDetailStateImpl &&
            (identical(other.seriesState, seriesState) ||
                other.seriesState == seriesState) &&
            (identical(other.recommendationState, recommendationState) ||
                other.recommendationState == recommendationState) &&
            const DeepCollectionEquality()
                .equals(other._seriesRecommendations, _seriesRecommendations) &&
            (identical(other.isAddedToWatchlist, isAddedToWatchlist) ||
                other.isAddedToWatchlist == isAddedToWatchlist) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.watchlistMessage, watchlistMessage) ||
                other.watchlistMessage == watchlistMessage) &&
            (identical(other.series, series) || other.series == series));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      seriesState,
      recommendationState,
      const DeepCollectionEquality().hash(_seriesRecommendations),
      isAddedToWatchlist,
      message,
      watchlistMessage,
      series);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesDetailStateImplCopyWith<_$SeriesDetailStateImpl> get copyWith =>
      __$$SeriesDetailStateImplCopyWithImpl<_$SeriesDetailStateImpl>(
          this, _$identity);
}

abstract class _SeriesDetailState implements SeriesDetailState {
  const factory _SeriesDetailState(
      {final RequestState seriesState,
      final RequestState recommendationState,
      final List<Series> seriesRecommendations,
      final bool isAddedToWatchlist,
      final String? message,
      final String? watchlistMessage,
      final SeriesDetail? series}) = _$SeriesDetailStateImpl;

  @override
  RequestState get seriesState;
  @override
  RequestState get recommendationState;
  @override
  List<Series> get seriesRecommendations;
  @override
  bool get isAddedToWatchlist;
  @override
  String? get message;
  @override
  String? get watchlistMessage;
  @override
  SeriesDetail? get series;
  @override
  @JsonKey(ignore: true)
  _$$SeriesDetailStateImplCopyWith<_$SeriesDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
