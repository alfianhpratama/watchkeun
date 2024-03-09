part of 'movie_search_cubit.dart';

@freezed
class MovieSearchState with _$MovieSearchState {
  const factory MovieSearchState({
    @Default(RequestState.empty) RequestState state,
    @Default([]) List<Movie> searchResult,
    String? message,
  }) = _MovieSearchState;
}
