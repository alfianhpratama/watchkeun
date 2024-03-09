import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/usecases/get_popular_series.dart';
import 'package:watchkeun/presentation/controller/series_list_popular_controller/series_list_popular_cubit.dart';

import '../../dummy_data/dummy_objects.dart';
import 'series_list_popular_controller_test.mocks.dart';

@GenerateMocks([GetPopularSeries])
void main() {
  late MockGetPopularSeries mockGetPopularSeries;
  late SeriesListPopularCubit cubit;
  late SeriesListPopularState state;

  setUp(() {
    mockGetPopularSeries = MockGetPopularSeries();
    cubit = SeriesListPopularCubit(getPopularSeries: mockGetPopularSeries);
    state = cubit.state;
  });

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  blocTest<SeriesListPopularCubit, SeriesListPopularState>(
    'should get result data when data is gotten successfully',
    build: () {
      when(mockGetPopularSeries.execute())
          .thenAnswer((_) async => Right(testSeriesList));
      return cubit;
    },
    act: (bloc) => cubit.fetchPopularSeries(),
    expect: () => <SeriesListPopularState>[
      state.copyWith(state: RequestState.loading),
      state.copyWith(state: RequestState.loaded, series: testSeriesList),
    ],
  );

  blocTest<SeriesListPopularCubit, SeriesListPopularState>(
    'should return error when data is unsuccessful',
    build: () {
      when(mockGetPopularSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (bloc) => cubit.fetchPopularSeries(),
    expect: () => <SeriesListPopularState>[
      state.copyWith(state: RequestState.loading),
      state.copyWith(state: RequestState.error, message: 'Server Failure'),
    ],
  );
}
