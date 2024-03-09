// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieListState {
  RequestState get nowPlayingState => throw _privateConstructorUsedError;
  RequestState get popularMoviesState => throw _privateConstructorUsedError;
  RequestState get topRatedMoviesState => throw _privateConstructorUsedError;
  List<Movie> get nowPlayingMovies => throw _privateConstructorUsedError;
  List<Movie> get popularMovies => throw _privateConstructorUsedError;
  List<Movie> get topRatedMovies => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieListStateCopyWith<MovieListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListStateCopyWith<$Res> {
  factory $MovieListStateCopyWith(
          MovieListState value, $Res Function(MovieListState) then) =
      _$MovieListStateCopyWithImpl<$Res, MovieListState>;
  @useResult
  $Res call(
      {RequestState nowPlayingState,
      RequestState popularMoviesState,
      RequestState topRatedMoviesState,
      List<Movie> nowPlayingMovies,
      List<Movie> popularMovies,
      List<Movie> topRatedMovies,
      String? message});
}

/// @nodoc
class _$MovieListStateCopyWithImpl<$Res, $Val extends MovieListState>
    implements $MovieListStateCopyWith<$Res> {
  _$MovieListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nowPlayingState = null,
    Object? popularMoviesState = null,
    Object? topRatedMoviesState = null,
    Object? nowPlayingMovies = null,
    Object? popularMovies = null,
    Object? topRatedMovies = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      nowPlayingState: null == nowPlayingState
          ? _value.nowPlayingState
          : nowPlayingState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      popularMoviesState: null == popularMoviesState
          ? _value.popularMoviesState
          : popularMoviesState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      topRatedMoviesState: null == topRatedMoviesState
          ? _value.topRatedMoviesState
          : topRatedMoviesState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      nowPlayingMovies: null == nowPlayingMovies
          ? _value.nowPlayingMovies
          : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      popularMovies: null == popularMovies
          ? _value.popularMovies
          : popularMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      topRatedMovies: null == topRatedMovies
          ? _value.topRatedMovies
          : topRatedMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieListStateImplCopyWith<$Res>
    implements $MovieListStateCopyWith<$Res> {
  factory _$$MovieListStateImplCopyWith(_$MovieListStateImpl value,
          $Res Function(_$MovieListStateImpl) then) =
      __$$MovieListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState nowPlayingState,
      RequestState popularMoviesState,
      RequestState topRatedMoviesState,
      List<Movie> nowPlayingMovies,
      List<Movie> popularMovies,
      List<Movie> topRatedMovies,
      String? message});
}

/// @nodoc
class __$$MovieListStateImplCopyWithImpl<$Res>
    extends _$MovieListStateCopyWithImpl<$Res, _$MovieListStateImpl>
    implements _$$MovieListStateImplCopyWith<$Res> {
  __$$MovieListStateImplCopyWithImpl(
      _$MovieListStateImpl _value, $Res Function(_$MovieListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nowPlayingState = null,
    Object? popularMoviesState = null,
    Object? topRatedMoviesState = null,
    Object? nowPlayingMovies = null,
    Object? popularMovies = null,
    Object? topRatedMovies = null,
    Object? message = freezed,
  }) {
    return _then(_$MovieListStateImpl(
      nowPlayingState: null == nowPlayingState
          ? _value.nowPlayingState
          : nowPlayingState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      popularMoviesState: null == popularMoviesState
          ? _value.popularMoviesState
          : popularMoviesState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      topRatedMoviesState: null == topRatedMoviesState
          ? _value.topRatedMoviesState
          : topRatedMoviesState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      nowPlayingMovies: null == nowPlayingMovies
          ? _value._nowPlayingMovies
          : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      popularMovies: null == popularMovies
          ? _value._popularMovies
          : popularMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      topRatedMovies: null == topRatedMovies
          ? _value._topRatedMovies
          : topRatedMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MovieListStateImpl implements _MovieListState {
  const _$MovieListStateImpl(
      {this.nowPlayingState = RequestState.empty,
      this.popularMoviesState = RequestState.empty,
      this.topRatedMoviesState = RequestState.empty,
      final List<Movie> nowPlayingMovies = const [],
      final List<Movie> popularMovies = const [],
      final List<Movie> topRatedMovies = const [],
      this.message})
      : _nowPlayingMovies = nowPlayingMovies,
        _popularMovies = popularMovies,
        _topRatedMovies = topRatedMovies;

  @override
  @JsonKey()
  final RequestState nowPlayingState;
  @override
  @JsonKey()
  final RequestState popularMoviesState;
  @override
  @JsonKey()
  final RequestState topRatedMoviesState;
  final List<Movie> _nowPlayingMovies;
  @override
  @JsonKey()
  List<Movie> get nowPlayingMovies {
    if (_nowPlayingMovies is EqualUnmodifiableListView)
      return _nowPlayingMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nowPlayingMovies);
  }

  final List<Movie> _popularMovies;
  @override
  @JsonKey()
  List<Movie> get popularMovies {
    if (_popularMovies is EqualUnmodifiableListView) return _popularMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularMovies);
  }

  final List<Movie> _topRatedMovies;
  @override
  @JsonKey()
  List<Movie> get topRatedMovies {
    if (_topRatedMovies is EqualUnmodifiableListView) return _topRatedMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topRatedMovies);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'MovieListState(nowPlayingState: $nowPlayingState, popularMoviesState: $popularMoviesState, topRatedMoviesState: $topRatedMoviesState, nowPlayingMovies: $nowPlayingMovies, popularMovies: $popularMovies, topRatedMovies: $topRatedMovies, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListStateImpl &&
            (identical(other.nowPlayingState, nowPlayingState) ||
                other.nowPlayingState == nowPlayingState) &&
            (identical(other.popularMoviesState, popularMoviesState) ||
                other.popularMoviesState == popularMoviesState) &&
            (identical(other.topRatedMoviesState, topRatedMoviesState) ||
                other.topRatedMoviesState == topRatedMoviesState) &&
            const DeepCollectionEquality()
                .equals(other._nowPlayingMovies, _nowPlayingMovies) &&
            const DeepCollectionEquality()
                .equals(other._popularMovies, _popularMovies) &&
            const DeepCollectionEquality()
                .equals(other._topRatedMovies, _topRatedMovies) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nowPlayingState,
      popularMoviesState,
      topRatedMoviesState,
      const DeepCollectionEquality().hash(_nowPlayingMovies),
      const DeepCollectionEquality().hash(_popularMovies),
      const DeepCollectionEquality().hash(_topRatedMovies),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListStateImplCopyWith<_$MovieListStateImpl> get copyWith =>
      __$$MovieListStateImplCopyWithImpl<_$MovieListStateImpl>(
          this, _$identity);
}

abstract class _MovieListState implements MovieListState {
  const factory _MovieListState(
      {final RequestState nowPlayingState,
      final RequestState popularMoviesState,
      final RequestState topRatedMoviesState,
      final List<Movie> nowPlayingMovies,
      final List<Movie> popularMovies,
      final List<Movie> topRatedMovies,
      final String? message}) = _$MovieListStateImpl;

  @override
  RequestState get nowPlayingState;
  @override
  RequestState get popularMoviesState;
  @override
  RequestState get topRatedMoviesState;
  @override
  List<Movie> get nowPlayingMovies;
  @override
  List<Movie> get popularMovies;
  @override
  List<Movie> get topRatedMovies;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$MovieListStateImplCopyWith<_$MovieListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
