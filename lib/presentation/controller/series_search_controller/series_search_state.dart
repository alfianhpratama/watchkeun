part of 'series_search_cubit.dart';

@freezed
class SeriesSearchState with _$SeriesSearchState {
  const factory SeriesSearchState({
    @Default(RequestState.empty) RequestState state,
    @Default([]) List<Series> searchResult,
    String? message,
  }) = _SeriesSearchState;
}
