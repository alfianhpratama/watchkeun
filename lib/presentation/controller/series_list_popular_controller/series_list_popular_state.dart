part of 'series_list_popular_cubit.dart';

@freezed
class SeriesListPopularState with _$SeriesListPopularState {
  const factory SeriesListPopularState({
    @Default(RequestState.empty) RequestState state,
    @Default([]) List<Series> series,
    String? message,
  }) = _SeriesListPopularState;
}
