// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieSearchState {
  RequestState get state => throw _privateConstructorUsedError;
  List<Movie> get searchResult => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieSearchStateCopyWith<MovieSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieSearchStateCopyWith<$Res> {
  factory $MovieSearchStateCopyWith(
          MovieSearchState value, $Res Function(MovieSearchState) then) =
      _$MovieSearchStateCopyWithImpl<$Res, MovieSearchState>;
  @useResult
  $Res call({RequestState state, List<Movie> searchResult, String? message});
}

/// @nodoc
class _$MovieSearchStateCopyWithImpl<$Res, $Val extends MovieSearchState>
    implements $MovieSearchStateCopyWith<$Res> {
  _$MovieSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? searchResult = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      searchResult: null == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieSearchStateImplCopyWith<$Res>
    implements $MovieSearchStateCopyWith<$Res> {
  factory _$$MovieSearchStateImplCopyWith(_$MovieSearchStateImpl value,
          $Res Function(_$MovieSearchStateImpl) then) =
      __$$MovieSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, List<Movie> searchResult, String? message});
}

/// @nodoc
class __$$MovieSearchStateImplCopyWithImpl<$Res>
    extends _$MovieSearchStateCopyWithImpl<$Res, _$MovieSearchStateImpl>
    implements _$$MovieSearchStateImplCopyWith<$Res> {
  __$$MovieSearchStateImplCopyWithImpl(_$MovieSearchStateImpl _value,
      $Res Function(_$MovieSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? searchResult = null,
    Object? message = freezed,
  }) {
    return _then(_$MovieSearchStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      searchResult: null == searchResult
          ? _value._searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MovieSearchStateImpl implements _MovieSearchState {
  const _$MovieSearchStateImpl(
      {this.state = RequestState.empty,
      final List<Movie> searchResult = const [],
      this.message})
      : _searchResult = searchResult;

  @override
  @JsonKey()
  final RequestState state;
  final List<Movie> _searchResult;
  @override
  @JsonKey()
  List<Movie> get searchResult {
    if (_searchResult is EqualUnmodifiableListView) return _searchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResult);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'MovieSearchState(state: $state, searchResult: $searchResult, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieSearchStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._searchResult, _searchResult) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state,
      const DeepCollectionEquality().hash(_searchResult), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieSearchStateImplCopyWith<_$MovieSearchStateImpl> get copyWith =>
      __$$MovieSearchStateImplCopyWithImpl<_$MovieSearchStateImpl>(
          this, _$identity);
}

abstract class _MovieSearchState implements MovieSearchState {
  const factory _MovieSearchState(
      {final RequestState state,
      final List<Movie> searchResult,
      final String? message}) = _$MovieSearchStateImpl;

  @override
  RequestState get state;
  @override
  List<Movie> get searchResult;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$MovieSearchStateImplCopyWith<_$MovieSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
