part of 'series_list_cubit.dart';

@freezed
class SeriesListState with _$SeriesListState {
  const factory SeriesListState({
    @Default(RequestState.empty) RequestState onAirState,
    @Default(RequestState.empty) RequestState popularSeriesState,
    @Default(RequestState.empty) RequestState topRatedSeriesState,
    @Default([]) List<Series> onAirSeries,
    @Default([]) List<Series> popularSeries,
    @Default([]) List<Series> topRatedSeries,
    String? message,
  }) = _SeriesListState;
}
