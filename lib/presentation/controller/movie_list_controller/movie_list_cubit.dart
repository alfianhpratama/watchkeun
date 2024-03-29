import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/get_now_playing_movies.dart';
import 'package:watchkeun/domain/usecases/get_popular_movies.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_movies.dart';

part 'movie_list_state.dart';

part 'movie_list_cubit.freezed.dart';

class MovieListCubit extends Cubit<MovieListState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;

  MovieListCubit({
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
    required this.getTopRatedMovies,
  }) : super(const MovieListState());

  Future<void> fetchNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingState: RequestState.loading));

    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          nowPlayingState: RequestState.error,
          message: failure.message,
        ));
      },
      (moviesData) {
        emit(state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: moviesData,
        ));
      },
    );
  }

  Future<void> fetchPopularMovies() async {
    emit(state.copyWith(popularMoviesState: RequestState.loading));

    final result = await getPopularMovies.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          popularMoviesState: RequestState.error,
          message: failure.message,
        ));
      },
      (moviesData) {
        emit(state.copyWith(
          popularMoviesState: RequestState.loaded,
          popularMovies: moviesData,
        ));
      },
    );
  }

  Future<void> fetchTopRatedMovies() async {
    emit(state.copyWith(topRatedMoviesState: RequestState.loading));

    final result = await getTopRatedMovies.execute();
    result.fold(
      (failure) {
        emit(state.copyWith(
          topRatedMoviesState: RequestState.error,
          message: failure.message,
        ));
      },
      (moviesData) {
        emit(state.copyWith(
          topRatedMoviesState: RequestState.loaded,
          topRatedMovies: moviesData,
        ));
      },
    );
  }
}
