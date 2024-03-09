part of 'watchlist_movie_cubit.dart';

@freezed
class WatchlistMovieState with _$WatchlistMovieState {
  const factory WatchlistMovieState({
    @Default(RequestState.empty) RequestState watchlistState,
    @Default([]) List<Movie> watchlistMovies,
    String? message,
  }) = _WatchlistMovieState;
}
