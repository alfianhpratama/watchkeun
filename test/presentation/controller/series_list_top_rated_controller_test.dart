import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_series.dart';
import 'package:watchkeun/presentation/controller/series_list_top_rated_controller/series_list_top_rated_cubit.dart';

import '../../dummy_data/dummy_objects.dart';
import 'series_list_top_rated_controller_test.mocks.dart';

@GenerateMocks([GetTopRatedSeries])
void main() {
  late MockGetTopRatedSeries mockGetTopRatedSeries;
  late SeriesListTopRatedCubit cubit;
  late SeriesListTopRatedState state;

  setUp(() {
    mockGetTopRatedSeries = MockGetTopRatedSeries();
    cubit = SeriesListTopRatedCubit(getTopRatedSeries: mockGetTopRatedSeries);
    state = cubit.state;
  });

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  blocTest<SeriesListTopRatedCubit, SeriesListTopRatedState>(
    'should get result data when data is gotten successfully',
    build: () {
      when(mockGetTopRatedSeries.execute())
          .thenAnswer((_) async => Right(testSeriesList));
      return cubit;
    },
    act: (bloc) => cubit.fetchTopRatedSeries(),
    expect: () => <SeriesListTopRatedState>[
      state.copyWith(state: RequestState.loading),
      state.copyWith(state: RequestState.loaded, series: testSeriesList),
    ],
  );

  blocTest<SeriesListTopRatedCubit, SeriesListTopRatedState>(
    'should return error when data is unsuccessful',
    build: () {
      when(mockGetTopRatedSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (bloc) => cubit.fetchTopRatedSeries(),
    expect: () => <SeriesListTopRatedState>[
      state.copyWith(state: RequestState.loading),
      state.copyWith(state: RequestState.error, message: 'Server Failure'),
    ],
  );
}
