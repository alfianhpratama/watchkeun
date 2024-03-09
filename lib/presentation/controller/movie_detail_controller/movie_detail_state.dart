part of 'movie_detail_cubit.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    @Default(RequestState.empty) RequestState movieState,
    @Default(RequestState.empty) RequestState recommendationState,
    MovieDetail? movie,
    String? message,
    String? watchlistMessage,
    @Default([]) List<Movie> movieRecommendations,
    @Default(false) bool isAddedToWatchlist,
  }) = _MovieDetailState;
}
