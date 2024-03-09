import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/domain/usecases/get_on_air_series.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/usecases/get_popular_series.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_series.dart';
import 'package:watchkeun/presentation/controller/series_list_controller/series_list_cubit.dart';
import 'package:watchkeun/common/state_enum.dart';

import '../../dummy_data/dummy_objects.dart';
import 'series_list_controller_test.mocks.dart';

@GenerateMocks([
  GetOnAirSeries,
  GetPopularSeries,
  GetTopRatedSeries,
])
void main() {
  late SeriesListCubit cubit;
  late MockGetOnAirSeries mockGetOnAirSeries;
  late MockGetPopularSeries mockGetPopularSeries;
  late MockGetTopRatedSeries mockGetTopRatedSeries;
  late SeriesListState state;

  setUp(() {
    mockGetOnAirSeries = MockGetOnAirSeries();
    mockGetPopularSeries = MockGetPopularSeries();
    mockGetTopRatedSeries = MockGetTopRatedSeries();
    cubit = SeriesListCubit(
      getOnAirSeries: mockGetOnAirSeries,
      getPopularSeries: mockGetPopularSeries,
      getTopRatedSeries: mockGetTopRatedSeries,
    );
    state = cubit.state;
  });

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  group('on air series', () {
    blocTest<SeriesListCubit, SeriesListState>(
      'should get data from the use case',
      build: () {
        when(mockGetOnAirSeries.execute())
            .thenAnswer((_) async => Right(testSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.fetchOnAirSeries(),
      expect: () => <SeriesListState>[
        state.copyWith(onAirState: RequestState.loading),
        state.copyWith(
          onAirState: RequestState.loaded,
          onAirSeries: testSeriesList,
        ),
      ],
    );
    blocTest<SeriesListCubit, SeriesListState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockGetOnAirSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchOnAirSeries(),
      expect: () => <SeriesListState>[
        state.copyWith(onAirState: RequestState.loading),
        state.copyWith(
          onAirState: RequestState.error,
          message: 'Server Failure',
        ),
      ],
    );
  });

  group('popular series', () {
    blocTest<SeriesListCubit, SeriesListState>(
      'should get data from the use case',
      build: () {
        when(mockGetPopularSeries.execute())
            .thenAnswer((_) async => Right(testSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.fetchPopularSeries(),
      expect: () => <SeriesListState>[
        state.copyWith(popularSeriesState: RequestState.loading),
        state.copyWith(
          popularSeriesState: RequestState.loaded,
          popularSeries: testSeriesList,
        ),
      ],
    );
    blocTest<SeriesListCubit, SeriesListState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockGetPopularSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchPopularSeries(),
      expect: () => <SeriesListState>[
        state.copyWith(popularSeriesState: RequestState.loading),
        state.copyWith(
          popularSeriesState: RequestState.error,
          message: 'Server Failure',
        ),
      ],
    );
  });

  group('top rated series', () {
    blocTest<SeriesListCubit, SeriesListState>(
      'should get data from the use case',
      build: () {
        when(mockGetTopRatedSeries.execute())
            .thenAnswer((_) async => Right(testSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedSeries(),
      expect: () => <SeriesListState>[
        state.copyWith(topRatedSeriesState: RequestState.loading),
        state.copyWith(
          topRatedSeriesState: RequestState.loaded,
          topRatedSeries: testSeriesList,
        ),
      ],
    );
    blocTest<SeriesListCubit, SeriesListState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockGetTopRatedSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedSeries(),
      expect: () => <SeriesListState>[
        state.copyWith(topRatedSeriesState: RequestState.loading),
        state.copyWith(
          topRatedSeriesState: RequestState.error,
          message: 'Server Failure',
        ),
      ],
    );
  });
}
