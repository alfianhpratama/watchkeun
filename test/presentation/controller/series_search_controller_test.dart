import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/usecases/search_series.dart';
import 'package:watchkeun/presentation/controller/series_search_controller/series_search_cubit.dart';

import '../../dummy_data/dummy_objects.dart';
import 'series_search_controller_test.mocks.dart';

@GenerateMocks([SearchSeries])
void main() {
  late SeriesSearchCubit cubit;
  late SeriesSearchState state;
  late MockSearchSeries mockSearchSeries;

  setUp(() {
    mockSearchSeries = MockSearchSeries();
    cubit = SeriesSearchCubit(searchSeries: mockSearchSeries);
    state = cubit.state;
  });

  const tQuery = 'doraemon';

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  group('search series', () {
    blocTest<SeriesSearchCubit, SeriesSearchState>(
      'should change search result data when data is gotten successfully',
      build: () {
        when(mockSearchSeries.execute(tQuery))
            .thenAnswer((_) async => Right(testSeriesList));
        return cubit;
      },
      act: (bloc) => cubit.fetchSeriesSearch(tQuery),
      expect: () => <SeriesSearchState>[
        state.copyWith(state: RequestState.loading),
        state.copyWith(
            state: RequestState.loaded, searchResult: testSeriesList),
      ],
    );

    blocTest<SeriesSearchCubit, SeriesSearchState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockSearchSeries.execute(tQuery)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (bloc) => cubit.fetchSeriesSearch(tQuery),
      expect: () => <SeriesSearchState>[
        state.copyWith(state: RequestState.loading),
        state.copyWith(state: RequestState.error, message: 'Server Failure'),
      ],
    );
  });
}
