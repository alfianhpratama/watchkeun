// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_movies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PopularMoviesState {
  RequestState get state => throw _privateConstructorUsedError;
  List<Movie> get movies => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PopularMoviesStateCopyWith<PopularMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularMoviesStateCopyWith<$Res> {
  factory $PopularMoviesStateCopyWith(
          PopularMoviesState value, $Res Function(PopularMoviesState) then) =
      _$PopularMoviesStateCopyWithImpl<$Res, PopularMoviesState>;
  @useResult
  $Res call({RequestState state, List<Movie> movies, String? message});
}

/// @nodoc
class _$PopularMoviesStateCopyWithImpl<$Res, $Val extends PopularMoviesState>
    implements $PopularMoviesStateCopyWith<$Res> {
  _$PopularMoviesStateCopyWithImpl(this._value, this._then);

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
abstract class _$$PopularMoviesStateImplCopyWith<$Res>
    implements $PopularMoviesStateCopyWith<$Res> {
  factory _$$PopularMoviesStateImplCopyWith(_$PopularMoviesStateImpl value,
          $Res Function(_$PopularMoviesStateImpl) then) =
      __$$PopularMoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, List<Movie> movies, String? message});
}

/// @nodoc
class __$$PopularMoviesStateImplCopyWithImpl<$Res>
    extends _$PopularMoviesStateCopyWithImpl<$Res, _$PopularMoviesStateImpl>
    implements _$$PopularMoviesStateImplCopyWith<$Res> {
  __$$PopularMoviesStateImplCopyWithImpl(_$PopularMoviesStateImpl _value,
      $Res Function(_$PopularMoviesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? movies = null,
    Object? message = freezed,
  }) {
    return _then(_$PopularMoviesStateImpl(
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

class _$PopularMoviesStateImpl implements _PopularMoviesState {
  const _$PopularMoviesStateImpl(
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
    return 'PopularMoviesState(state: $state, movies: $movies, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularMoviesStateImpl &&
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
  _$$PopularMoviesStateImplCopyWith<_$PopularMoviesStateImpl> get copyWith =>
      __$$PopularMoviesStateImplCopyWithImpl<_$PopularMoviesStateImpl>(
          this, _$identity);
}

abstract class _PopularMoviesState implements PopularMoviesState {
  const factory _PopularMoviesState(
      {final RequestState state,
      final List<Movie> movies,
      final String? message}) = _$PopularMoviesStateImpl;

  @override
  RequestState get state;
  @override
  List<Movie> get movies;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PopularMoviesStateImplCopyWith<_$PopularMoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
