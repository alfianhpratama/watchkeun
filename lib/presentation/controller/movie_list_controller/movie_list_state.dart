part of 'movie_list_cubit.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState({
    @Default(RequestState.empty) RequestState nowPlayingState,
    @Default(RequestState.empty) RequestState popularMoviesState,
    @Default(RequestState.empty) RequestState topRatedMoviesState,
    @Default([]) List<Movie> nowPlayingMovies,
    @Default([]) List<Movie> popularMovies,
    @Default([]) List<Movie> topRatedMovies,
    String? message,
  }) = _MovieListState;
}
