import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_series.dart';

part 'watchlist_series_state.dart';

part 'watchlist_series_cubit.freezed.dart';

class WatchlistSeriesCubit extends Cubit<WatchlistSeriesState> {
  final GetWatchlistSeries getWatchlistSeries;

  WatchlistSeriesCubit({required this.getWatchlistSeries})
      : super(const WatchlistSeriesState());

  Future<void> fetchWatchlistSeries() async {
    emit(state.copyWith(watchlistState: RequestState.loading));

    final result = await getWatchlistSeries.execute();
    result.fold(
      (failure) => emit(state.copyWith(
        watchlistState: RequestState.error,
        message: failure.message,
      )),
      (seriesData) => emit(state.copyWith(
        watchlistState: RequestState.loaded,
        watchlistSeries: seriesData,
      )),
    );
  }
}
