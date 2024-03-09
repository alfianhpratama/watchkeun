import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';
import 'package:watchkeun/domain/usecases/get_recommendations_series.dart';
import 'package:watchkeun/domain/usecases/get_series_detail.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_series_status.dart';
import 'package:watchkeun/domain/usecases/remove_series_watchlist.dart';
import 'package:watchkeun/domain/usecases/save_series_watchlist.dart';

part 'series_detail_state.dart';

part 'series_detail_cubit.freezed.dart';

class SeriesDetailCubit extends Cubit<SeriesDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist Series';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist Series';

  final GetSeriesDetail getSeriesDetail;
  final GetRecommendationsSeries getRecommendationsSeries;
  final GetWatchListSeriesStatus getWatchListSeriesStatus;
  final SaveSeriesWatchlist saveSeriesWatchlist;
  final RemoveSeriesWatchlist removeSeriesWatchlist;

  SeriesDetailCubit({
    required this.getSeriesDetail,
    required this.getRecommendationsSeries,
    required this.getWatchListSeriesStatus,
    required this.saveSeriesWatchlist,
    required this.removeSeriesWatchlist,
  }) : super(const SeriesDetailState());

  Future<void> fetchSeriesDetail(int id) async {
    emit(state.copyWith(seriesState: RequestState.loading));

    final detailResponse = await getSeriesDetail.execute(id);
    final recommendationResponse = await getRecommendationsSeries.execute(id);
    detailResponse.fold(
      (failure) => emit(state.copyWith(
        seriesState: RequestState.error,
        message: failure.message,
      )),
      (result) {
        emit(state.copyWith(
          recommendationState: RequestState.loading,
          series: result,
        ));

        recommendationResponse.fold(
          (failure) => emit(state.copyWith(
            recommendationState: RequestState.error,
            seriesState: RequestState.loaded,
            message: failure.message,
          )),
          (result) => emit(state.copyWith(
            recommendationState: RequestState.loaded,
            seriesState: RequestState.loaded,
            seriesRecommendations: result,
          )),
        );
      },
    );
  }

  Future<void> addWatchlist(SeriesDetail series) async {
    final result = await saveSeriesWatchlist.execute(series);

    result.fold(
      (failure) => emit(state.copyWith(
        watchlistMessage: failure.message,
      )),
      (successMessage) => emit(state.copyWith(
        watchlistMessage: successMessage,
      )),
    );

    await loadWatchlistStatus(series.id);
  }

  Future<void> removeFromWatchlist(SeriesDetail series) async {
    final result = await removeSeriesWatchlist.execute(series);

    result.fold(
      (failure) => emit(state.copyWith(
        watchlistMessage: failure.message,
      )),
      (successMessage) => emit(state.copyWith(
        watchlistMessage: successMessage,
      )),
    );

    await loadWatchlistStatus(series.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListSeriesStatus.execute(id);
    emit(state.copyWith(isAddedToWatchlist: result));
  }
}
