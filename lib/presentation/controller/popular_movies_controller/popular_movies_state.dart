part of 'popular_movies_cubit.dart';

@freezed
class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState({
    @Default(RequestState.empty) RequestState state,
    @Default([]) List<Movie> movies,
    String? message,
  }) = _PopularMoviesState;
}
