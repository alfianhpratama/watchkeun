// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_movies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TopRatedMoviesState {
  RequestState get state => throw _privateConstructorUsedError;
  List<Movie> get movies => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopRatedMoviesStateCopyWith<TopRatedMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopRatedMoviesStateCopyWith<$Res> {
  factory $TopRatedMoviesStateCopyWith(
          TopRatedMoviesState value, $Res Function(TopRatedMoviesState) then) =
      _$TopRatedMoviesStateCopyWithImpl<$Res, TopRatedMoviesState>;
  @useResult
  $Res call({RequestState state, List<Movie> movies, String? message});
}

/// @nodoc
class _$TopRatedMoviesStateCopyWithImpl<$Res, $Val extends TopRatedMoviesState>
    implements $TopRatedMoviesStateCopyWith<$Res> {
  _$TopRatedMoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? movies = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopRatedMoviesStateImplCopyWith<$Res>
    implements $TopRatedMoviesStateCopyWith<$Res> {
  factory _$$TopRatedMoviesStateImplCopyWith(_$TopRatedMoviesStateImpl value,
          $Res Function(_$TopRatedMoviesStateImpl) then) =
      __$$TopRatedMoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, List<Movie> movies, String? message});
}

/// @nodoc
class __$$TopRatedMoviesStateImplCopyWithImpl<$Res>
    extends _$TopRatedMoviesStateCopyWithImpl<$Res, _$TopRatedMoviesStateImpl>
    implements _$$TopRatedMoviesStateImplCopyWith<$Res> {
  __$$TopRatedMoviesStateImplCopyWithImpl(_$TopRatedMoviesStateImpl _value,
      $Res Function(_$TopRatedMoviesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? movies = null,
    Object? message = freezed,
  }) {
    return _then(_$TopRatedMoviesStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TopRatedMoviesStateImpl implements _TopRatedMoviesState {
  const _$TopRatedMoviesStateImpl(
      {this.state = RequestState.empty,
      final List<Movie> movies = const [],
      this.message})
      : _movies = movies;

  @override
  @JsonKey()
  final RequestState state;
  final List<Movie> _movies;
  @override
  @JsonKey()
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'TopRatedMoviesState(state: $state, movies: $movies, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopRatedMoviesStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state,
      const DeepCollectionEquality().hash(_movies), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopRatedMoviesStateImplCopyWith<_$TopRatedMoviesStateImpl> get copyWith =>
      __$$TopRatedMoviesStateImplCopyWithImpl<_$TopRatedMoviesStateImpl>(
          this, _$identity);
}

abstract class _TopRatedMoviesState implements TopRatedMoviesState {
  const factory _TopRatedMoviesState(
      {final RequestState state,
      final List<Movie> movies,
      final String? message}) = _$TopRatedMoviesStateImpl;

  @override
  RequestState get state;
  @override
  List<Movie> get movies;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$TopRatedMoviesStateImplCopyWith<_$TopRatedMoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
