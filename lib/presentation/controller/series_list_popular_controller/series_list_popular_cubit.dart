import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/usecases/get_popular_series.dart';

part 'series_list_popular_state.dart';

part 'series_list_popular_cubit.freezed.dart';

class SeriesListPopularCubit extends Cubit<SeriesListPopularState> {
  final GetPopularSeries getPopularSeries;

  SeriesListPopularCubit({required this.getPopularSeries})
      : super(const SeriesListPopularState());

  Future<void> fetchPopularSeries() async {
    emit(state.copyWith(state: RequestState.loading));

    final response = await getPopularSeries.execute();
    response.fold(
      (failure) => emit(state.copyWith(
        state: RequestState.error,
        message: failure.message,
      )),
      (result) => emit(state.copyWith(
        state: RequestState.loaded,
        series: result,
      )),
    );
  }
}
