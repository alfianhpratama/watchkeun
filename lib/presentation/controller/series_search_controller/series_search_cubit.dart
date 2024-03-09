import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/usecases/search_series.dart';

part 'series_search_state.dart';

part 'series_search_cubit.freezed.dart';

class SeriesSearchCubit extends Cubit<SeriesSearchState> {
  final SearchSeries searchSeries;

  SeriesSearchCubit({required this.searchSeries})
      : super(const SeriesSearchState());

  Future<void> fetchSeriesSearch(String query) async {
    emit(state.copyWith(state: RequestState.loading));

    final response = await searchSeries.execute(query);
    response.fold(
      (failure) => emit(state.copyWith(
        state: RequestState.error,
        message: failure.message,
      )),
      (result) => emit(state.copyWith(
        state: RequestState.loaded,
        searchResult: result,
      )),
    );
  }
}
