part of 'watchlist_series_cubit.dart';

@freezed
class WatchlistSeriesState with _$WatchlistSeriesState {
  const factory WatchlistSeriesState({
    @Default(RequestState.empty) RequestState watchlistState,
    @Default([]) List<Series> watchlistSeries,
    String? message,
  }) = _WatchlistSeriesState;
}
