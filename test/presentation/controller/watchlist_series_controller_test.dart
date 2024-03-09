import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_series.dart';
import 'package:watchkeun/presentation/controller/watchlist_series_controller/watchlist_series_cubit.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_series_controller_test.mocks.dart';

@GenerateMocks([GetWatchlistSeries])
void main() {
  late WatchlistSeriesCubit cubit;
  late WatchlistSeriesState state;
  late MockGetWatchlistSeries mockGetWatchlistSeries;

  setUp(() {
    mockGetWatchlistSeries = MockGetWatchlistSeries();
    cubit = WatchlistSeriesCubit(getWatchlistSeries: mockGetWatchlistSeries);
    state = cubit.state;
  });

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  blocTest<WatchlistSeriesCubit, WatchlistSeriesState>(
    'should change movies data when data is gotten successfully',
    build: () {
      when(mockGetWatchlistSeries.execute())
          .thenAnswer((_) async => const Right([testWatchlistSeries]));
      return cubit;
    },
    act: (cubit) => cubit.fetchWatchlistSeries(),
    expect: () => <WatchlistSeriesState>[
      state.copyWith(watchlistState: RequestState.loading),
      state.copyWith(
        watchlistState: RequestState.loaded,
        watchlistSeries: [testWatchlistSeries],
      ),
    ],
  );

  blocTest<WatchlistSeriesCubit, WatchlistSeriesState>(
    'should return error when data is unsuccessful',
    build: () {
      when(mockGetWatchlistSeries.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure("Can't get data")));
      return cubit;
    },
    act: (cubit) => cubit.fetchWatchlistSeries(),
    expect: () => <WatchlistSeriesState>[
      state.copyWith(watchlistState: RequestState.loading),
      state.copyWith(
        watchlistState: RequestState.error,
        message: "Can't get data",
      ),
    ],
  );
}
