// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieDetailState {
  RequestState get movieState => throw _privateConstructorUsedError;
  RequestState get recommendationState => throw _privateConstructorUsedError;
  MovieDetail? get movie => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get watchlistMessage => throw _privateConstructorUsedError;
  List<Movie> get movieRecommendations => throw _privateConstructorUsedError;
  bool get isAddedToWatchlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailStateCopyWith<MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailStateCopyWith<$Res> {
  factory $MovieDetailStateCopyWith(
          MovieDetailState value, $Res Function(MovieDetailState) then) =
      _$MovieDetailStateCopyWithImpl<$Res, MovieDetailState>;
  @useResult
  $Res call(
      {RequestState movieState,
      RequestState recommendationState,
      MovieDetail? movie,
      String? message,
      String? watchlistMessage,
      List<Movie> movieRecommendations,
      bool isAddedToWatchlist});
}

/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res, $Val extends MovieDetailState>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieState = null,
    Object? recommendationState = null,
    Object? movie = freezed,
    Object? message = freezed,
    Object? watchlistMessage = freezed,
    Object? movieRecommendations = null,
    Object? isAddedToWatchlist = null,
  }) {
    return _then(_value.copyWith(
      movieState: null == movieState
          ? _value.movieState
          : movieState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      recommendationState: null == recommendationState
          ? _value.recommendationState
          : recommendationState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetail?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      watchlistMessage: freezed == watchlistMessage
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      movieRecommendations: null == movieRecommendations
          ? _value.movieRecommendations
          : movieRecommendations // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isAddedToWatchlist: null == isAddedToWatchlist
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieDetailStateImplCopyWith<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  factory _$$MovieDetailStateImplCopyWith(_$MovieDetailStateImpl value,
          $Res Function(_$MovieDetailStateImpl) then) =
      __$$MovieDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState movieState,
      RequestState recommendationState,
      MovieDetail? movie,
      String? message,
      String? watchlistMessage,
      List<Movie> movieRecommendations,
      bool isAddedToWatchlist});
}

/// @nodoc
class __$$MovieDetailStateImplCopyWithImpl<$Res>
    extends _$MovieDetailStateCopyWithImpl<$Res, _$MovieDetailStateImpl>
    implements _$$MovieDetailStateImplCopyWith<$Res> {
  __$$MovieDetailStateImplCopyWithImpl(_$MovieDetailStateImpl _value,
      $Res Function(_$MovieDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieState = null,
    Object? recommendationState = null,
    Object? movie = freezed,
    Object? message = freezed,
    Object? watchlistMessage = freezed,
    Object? movieRecommendations = null,
    Object? isAddedToWatchlist = null,
  }) {
    return _then(_$MovieDetailStateImpl(
      movieState: null == movieState
          ? _value.movieState
          : movieState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      recommendationState: null == recommendationState
          ? _value.recommendationState
          : recommendationState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetail?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      watchlistMessage: freezed == watchlistMessage
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      movieRecommendations: null == movieRecommendations
          ? _value._movieRecommendations
          : movieRecommendations // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isAddedToWatchlist: null == isAddedToWatchlist
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MovieDetailStateImpl implements _MovieDetailState {
  const _$MovieDetailStateImpl(
      {this.movieState = RequestState.empty,
      this.recommendationState = RequestState.empty,
      this.movie,
      this.message,
      this.watchlistMessage,
      final List<Movie> movieRecommendations = const [],
      this.isAddedToWatchlist = false})
      : _movieRecommendations = movieRecommendations;

  @override
  @JsonKey()
  final RequestState movieState;
  @override
  @JsonKey()
  final RequestState recommendationState;
  @override
  final MovieDetail? movie;
  @override
  final String? message;
  @override
  final String? watchlistMessage;
  final List<Movie> _movieRecommendations;
  @override
  @JsonKey()
  List<Movie> get movieRecommendations {
    if (_movieRecommendations is EqualUnmodifiableListView)
      return _movieRecommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movieRecommendations);
  }

  @override
  @JsonKey()
  final bool isAddedToWatchlist;

  @override
  String toString() {
    return 'MovieDetailState(movieState: $movieState, recommendationState: $recommendationState, movie: $movie, message: $message, watchlistMessage: $watchlistMessage, movieRecommendations: $movieRecommendations, isAddedToWatchlist: $isAddedToWatchlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailStateImpl &&
            (identical(other.movieState, movieState) ||
                other.movieState == movieState) &&
            (identical(other.recommendationState, recommendationState) ||
                other.recommendationState == recommendationState) &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.watchlistMessage, watchlistMessage) ||
                other.watchlistMessage == watchlistMessage) &&
            const DeepCollectionEquality()
                .equals(other._movieRecommendations, _movieRecommendations) &&
            (identical(other.isAddedToWatchlist, isAddedToWatchlist) ||
                other.isAddedToWatchlist == isAddedToWatchlist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      movieState,
      recommendationState,
      movie,
      message,
      watchlistMessage,
      const DeepCollectionEquality().hash(_movieRecommendations),
      isAddedToWatchlist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailStateImplCopyWith<_$MovieDetailStateImpl> get copyWith =>
      __$$MovieDetailStateImplCopyWithImpl<_$MovieDetailStateImpl>(
          this, _$identity);
}

abstract class _MovieDetailState implements MovieDetailState {
  const factory _MovieDetailState(
      {final RequestState movieState,
      final RequestState recommendationState,
      final MovieDetail? movie,
      final String? message,
      final String? watchlistMessage,
      final List<Movie> movieRecommendations,
      final bool isAddedToWatchlist}) = _$MovieDetailStateImpl;

  @override
  RequestState get movieState;
  @override
  RequestState get recommendationState;
  @override
  MovieDetail? get movie;
  @override
  String? get message;
  @override
  String? get watchlistMessage;
  @override
  List<Movie> get movieRecommendations;
  @override
  bool get isAddedToWatchlist;
  @override
  @JsonKey(ignore: true)
  _$$MovieDetailStateImplCopyWith<_$MovieDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
