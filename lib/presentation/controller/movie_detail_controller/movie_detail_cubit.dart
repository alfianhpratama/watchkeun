import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/entities/movie_detail.dart';
import 'package:watchkeun/domain/usecases/get_movie_detail.dart';
import 'package:watchkeun/domain/usecases/get_movie_recommendations.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_status.dart';
import 'package:watchkeun/domain/usecases/remove_watchlist.dart';
import 'package:watchkeun/domain/usecases/save_watchlist.dart';

part 'movie_detail_state.dart';

part 'movie_detail_cubit.freezed.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  MovieDetailCubit({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(const MovieDetailState());

  Future<void> fetchMovieDetail(int id) async {
    emit(state.copyWith(movieState: RequestState.loading));

    final detailResult = await getMovieDetail.execute(id);
    final recommendationResult = await getMovieRecommendations.execute(id);

    detailResult.fold(
      (failure) => emit(state.copyWith(
        movieState: RequestState.error,
        message: failure.message,
      )),
      (movie) {
        emit(state.copyWith(
          recommendationState: RequestState.loading,
          movie: movie,
        ));

        recommendationResult.fold(
          (failure) => emit(state.copyWith(
            recommendationState: RequestState.error,
            movieState: RequestState.loaded,
            message: failure.message,
          )),
          (movies) => emit(state.copyWith(
            recommendationState: RequestState.loaded,
            movieState: RequestState.loaded,
            movieRecommendations: movies,
          )),
        );
      },
    );
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await saveWatchlist.execute(movie);

    result.fold(
      (failure) => emit(state.copyWith(
        watchlistMessage: failure.message,
      )),
      (successMessage) => emit(state.copyWith(
        watchlistMessage: successMessage,
      )),
    );

    await loadWatchlistStatus(movie.id);
  }

  Future<void> removeFromWatchlist(MovieDetail movie) async {
    final result = await removeWatchlist.execute(movie);

    result.fold(
      (failure) => emit(state.copyWith(
        watchlistMessage: failure.message,
      )),
      (successMessage) => emit(state.copyWith(
        watchlistMessage: successMessage,
      )),
    );

    await loadWatchlistStatus(movie.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    emit(state.copyWith(isAddedToWatchlist: result));
  }
}
