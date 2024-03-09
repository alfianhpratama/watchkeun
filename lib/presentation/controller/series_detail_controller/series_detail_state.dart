part of 'series_detail_cubit.dart';

@freezed
class SeriesDetailState with _$SeriesDetailState {
  const factory SeriesDetailState({
    @Default(RequestState.empty) RequestState seriesState,
    @Default(RequestState.empty) RequestState recommendationState,
    @Default([]) List<Series> seriesRecommendations,
    @Default(false) bool isAddedToWatchlist,
    String? message,
    String? watchlistMessage,
    SeriesDetail? series,
  }) = _SeriesDetailState;
}
