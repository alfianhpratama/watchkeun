import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/usecases/get_on_air_series.dart';
import 'package:watchkeun/domain/usecases/get_popular_series.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_series.dart';

part 'series_list_state.dart';

part 'series_list_cubit.freezed.dart';

class SeriesListCubit extends Cubit<SeriesListState> {
  final GetOnAirSeries getOnAirSeries;
  final GetPopularSeries getPopularSeries;
  final GetTopRatedSeries getTopRatedSeries;

  SeriesListCubit({
    required this.getOnAirSeries,
    required this.getPopularSeries,
    required this.getTopRatedSeries,
  }) : super(const SeriesListState());

  Future<void> fetchOnAirSeries() async {
    emit(state.copyWith(onAirState: RequestState.loading));

    final response = await getOnAirSeries.execute();
    response.fold(
      (failure) {
        emit(state.copyWith(
          onAirState: RequestState.error,
          message: failure.message,
        ));
      },
      (result) {
        emit(state.copyWith(
          onAirState: RequestState.loaded,
          onAirSeries: result,
        ));
      },
    );
  }

  Future<void> fetchPopularSeries() async {
    emit(state.copyWith(popularSeriesState: RequestState.loading));

    final response = await getPopularSeries.execute();
    response.fold(
      (failure) => emit(state.copyWith(
        popularSeriesState: RequestState.error,
        message: failure.message,
      )),
      (result) => emit(state.copyWith(
        popularSeriesState: RequestState.loaded,
        popularSeries: result,
      )),
    );
  }

  Future<void> fetchTopRatedSeries() async {
    emit(state.copyWith(topRatedSeriesState: RequestState.loading));

    final response = await getTopRatedSeries.execute();
    response.fold(
      (failure) => emit(state.copyWith(
        topRatedSeriesState: RequestState.error,
        message: failure.message,
      )),
      (result) => emit(state.copyWith(
        topRatedSeriesState: RequestState.loaded,
        topRatedSeries: result,
      )),
    );
  }
}
