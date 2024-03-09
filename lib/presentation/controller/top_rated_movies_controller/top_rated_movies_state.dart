part of 'top_rated_movies_cubit.dart';

@freezed
class TopRatedMoviesState with _$TopRatedMoviesState {
  const factory TopRatedMoviesState({
    @Default(RequestState.empty) RequestState state,
    @Default([]) List<Movie> movies,
    String? message,
  }) = _TopRatedMoviesState;
}
