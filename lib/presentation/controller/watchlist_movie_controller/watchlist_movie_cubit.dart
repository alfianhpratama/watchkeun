import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_movies.dart';

part 'watchlist_movie_state.dart';

part 'watchlist_movie_cubit.freezed.dart';

class WatchlistMovieCubit extends Cubit<WatchlistMovieState> {
  final GetWatchlistMovies getWatchlistMovies;

  WatchlistMovieCubit({required this.getWatchlistMovies})
      : super(const WatchlistMovieState());

  Future<void> fetchWatchlistMovies() async {
    emit(state.copyWith(watchlistState: RequestState.loading));

    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) => emit(state.copyWith(
        watchlistState: RequestState.error,
        message: failure.message,
      )),
      (moviesData) => emit(state.copyWith(
        watchlistState: RequestState.loaded,
        watchlistMovies: moviesData,
      )),
    );
  }
}
