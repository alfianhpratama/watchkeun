// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_movie_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WatchlistMovieState {
  RequestState get watchlistState => throw _privateConstructorUsedError;
  List<Movie> get watchlistMovies => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WatchlistMovieStateCopyWith<WatchlistMovieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistMovieStateCopyWith<$Res> {
  factory $WatchlistMovieStateCopyWith(
          WatchlistMovieState value, $Res Function(WatchlistMovieState) then) =
      _$WatchlistMovieStateCopyWithImpl<$Res, WatchlistMovieState>;
  @useResult
  $Res call(
      {RequestState watchlistState,
      List<Movie> watchlistMovies,
      String? message});
}

/// @nodoc
class _$WatchlistMovieStateCopyWithImpl<$Res, $Val extends WatchlistMovieState>
    implements $WatchlistMovieStateCopyWith<$Res> {
  _$WatchlistMovieStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlistState = null,
    Object? watchlistMovies = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      watchlistState: null == watchlistState
          ? _value.watchlistState
          : watchlistState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      watchlistMovies: null == watchlistMovies
          ? _value.watchlistMovies
          : watchlistMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistMovieStateImplCopyWith<$Res>
    implements $WatchlistMovieStateCopyWith<$Res> {
  factory _$$WatchlistMovieStateImplCopyWith(_$WatchlistMovieStateImpl value,
          $Res Function(_$WatchlistMovieStateImpl) then) =
      __$$WatchlistMovieStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState watchlistState,
      List<Movie> watchlistMovies,
      String? message});
}

/// @nodoc
class __$$WatchlistMovieStateImplCopyWithImpl<$Res>
    extends _$WatchlistMovieStateCopyWithImpl<$Res, _$WatchlistMovieStateImpl>
    implements _$$WatchlistMovieStateImplCopyWith<$Res> {
  __$$WatchlistMovieStateImplCopyWithImpl(_$WatchlistMovieStateImpl _value,
      $Res Function(_$WatchlistMovieStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlistState = null,
    Object? watchlistMovies = null,
    Object? message = freezed,
  }) {
    return _then(_$WatchlistMovieStateImpl(
      watchlistState: null == watchlistState
          ? _value.watchlistState
          : watchlistState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      watchlistMovies: null == watchlistMovies
          ? _value._watchlistMovies
          : watchlistMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WatchlistMovieStateImpl implements _WatchlistMovieState {
  const _$WatchlistMovieStateImpl(
      {this.watchlistState = RequestState.empty,
      final List<Movie> watchlistMovies = const [],
      this.message})
      : _watchlistMovies = watchlistMovies;

  @override
  @JsonKey()
  final RequestState watchlistState;
  final List<Movie> _watchlistMovies;
  @override
  @JsonKey()
  List<Movie> get watchlistMovies {
    if (_watchlistMovies is EqualUnmodifiableListView) return _watchlistMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_watchlistMovies);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'WatchlistMovieState(watchlistState: $watchlistState, watchlistMovies: $watchlistMovies, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistMovieStateImpl &&
            (identical(other.watchlistState, watchlistState) ||
                other.watchlistState == watchlistState) &&
            const DeepCollectionEquality()
                .equals(other._watchlistMovies, _watchlistMovies) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, watchlistState,
      const DeepCollectionEquality().hash(_watchlistMovies), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistMovieStateImplCopyWith<_$WatchlistMovieStateImpl> get copyWith =>
      __$$WatchlistMovieStateImplCopyWithImpl<_$WatchlistMovieStateImpl>(
          this, _$identity);
}

abstract class _WatchlistMovieState implements WatchlistMovieState {
  const factory _WatchlistMovieState(
      {final RequestState watchlistState,
      final List<Movie> watchlistMovies,
      final String? message}) = _$WatchlistMovieStateImpl;

  @override
  RequestState get watchlistState;
  @override
  List<Movie> get watchlistMovies;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$WatchlistMovieStateImplCopyWith<_$WatchlistMovieStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
