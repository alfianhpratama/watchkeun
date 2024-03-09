import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_series.dart';

part 'series_list_top_rated_state.dart';

part 'series_list_top_rated_cubit.freezed.dart';

class SeriesListTopRatedCubit extends Cubit<SeriesListTopRatedState> {
  final GetTopRatedSeries getTopRatedSeries;

  SeriesListTopRatedCubit({required this.getTopRatedSeries})
      : super(const SeriesListTopRatedState());

  Future<void> fetchTopRatedSeries() async {
    emit(state.copyWith(state: RequestState.loading));

    final response = await getTopRatedSeries.execute();
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
