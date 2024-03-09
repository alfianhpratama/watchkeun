// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeriesSearchState {
  RequestState get state => throw _privateConstructorUsedError;
  List<Series> get searchResult => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeriesSearchStateCopyWith<SeriesSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesSearchStateCopyWith<$Res> {
  factory $SeriesSearchStateCopyWith(
          SeriesSearchState value, $Res Function(SeriesSearchState) then) =
      _$SeriesSearchStateCopyWithImpl<$Res, SeriesSearchState>;
  @useResult
  $Res call({RequestState state, List<Series> searchResult, String? message});
}

/// @nodoc
class _$SeriesSearchStateCopyWithImpl<$Res, $Val extends SeriesSearchState>
    implements $SeriesSearchStateCopyWith<$Res> {
  _$SeriesSearchStateCopyWithImpl(this._value, this._then);

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
              as List<Series>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesSearchStateImplCopyWith<$Res>
    implements $SeriesSearchStateCopyWith<$Res> {
  factory _$$SeriesSearchStateImplCopyWith(_$SeriesSearchStateImpl value,
          $Res Function(_$SeriesSearchStateImpl) then) =
      __$$SeriesSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, List<Series> searchResult, String? message});
}

/// @nodoc
class __$$SeriesSearchStateImplCopyWithImpl<$Res>
    extends _$SeriesSearchStateCopyWithImpl<$Res, _$SeriesSearchStateImpl>
    implements _$$SeriesSearchStateImplCopyWith<$Res> {
  __$$SeriesSearchStateImplCopyWithImpl(_$SeriesSearchStateImpl _value,
      $Res Function(_$SeriesSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? searchResult = null,
    Object? message = freezed,
  }) {
    return _then(_$SeriesSearchStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      searchResult: null == searchResult
          ? _value._searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<Series>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SeriesSearchStateImpl implements _SeriesSearchState {
  const _$SeriesSearchStateImpl(
      {this.state = RequestState.empty,
      final List<Series> searchResult = const [],
      this.message})
      : _searchResult = searchResult;

  @override
  @JsonKey()
  final RequestState state;
  final List<Series> _searchResult;
  @override
  @JsonKey()
  List<Series> get searchResult {
    if (_searchResult is EqualUnmodifiableListView) return _searchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResult);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'SeriesSearchState(state: $state, searchResult: $searchResult, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesSearchStateImpl &&
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
  _$$SeriesSearchStateImplCopyWith<_$SeriesSearchStateImpl> get copyWith =>
      __$$SeriesSearchStateImplCopyWithImpl<_$SeriesSearchStateImpl>(
          this, _$identity);
}

abstract class _SeriesSearchState implements SeriesSearchState {
  const factory _SeriesSearchState(
      {final RequestState state,
      final List<Series> searchResult,
      final String? message}) = _$SeriesSearchStateImpl;

  @override
  RequestState get state;
  @override
  List<Series> get searchResult;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$SeriesSearchStateImplCopyWith<_$SeriesSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
