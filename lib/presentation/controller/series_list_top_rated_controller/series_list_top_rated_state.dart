part of 'series_list_top_rated_cubit.dart';

@freezed
class SeriesListTopRatedState with _$SeriesListTopRatedState {
  const factory SeriesListTopRatedState({
    @Default(RequestState.empty) RequestState state,
    @Default([]) List<Series> series,
    String? message,
  }) = _SeriesListTopRatedState;
}
