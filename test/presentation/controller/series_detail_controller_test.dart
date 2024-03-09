import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/domain/usecases/get_recommendations_series.dart';
import 'package:watchkeun/domain/usecases/get_series_detail.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_series_status.dart';
import 'package:watchkeun/domain/usecases/remove_series_watchlist.dart';
import 'package:watchkeun/domain/usecases/save_series_watchlist.dart';
import 'package:watchkeun/presentation/controller/series_detail_controller/series_detail_cubit.dart';
import 'package:watchkeun/common/state_enum.dart';

import '../../dummy_data/dummy_objects.dart';
import 'series_detail_controller_test.mocks.dart';

@GenerateMocks([
  GetSeriesDetail,
  GetRecommendationsSeries,
  GetWatchListSeriesStatus,
  SaveSeriesWatchlist,
  RemoveSeriesWatchlist,
])
void main() {
  late SeriesDetailCubit cubit;
  late MockGetSeriesDetail mockGetSeriesDetail;
  late MockGetRecommendationsSeries mockGetRecommendationsSeries;
  late MockGetWatchListSeriesStatus mockGetWatchlistStatus;
  late MockSaveSeriesWatchlist mockSaveSeriesWatchlist;
  late MockRemoveSeriesWatchlist mockRemoveSeriesWatchlist;
  late SeriesDetailState state;

  setUp(() {
    mockGetSeriesDetail = MockGetSeriesDetail();
    mockGetRecommendationsSeries = MockGetRecommendationsSeries();
    mockGetWatchlistStatus = MockGetWatchListSeriesStatus();
    mockSaveSeriesWatchlist = MockSaveSeriesWatchlist();
    mockRemoveSeriesWatchlist = MockRemoveSeriesWatchlist();
    cubit = SeriesDetailCubit(
      getSeriesDetail: mockGetSeriesDetail,
      getRecommendationsSeries: mockGetRecommendationsSeries,
      getWatchListSeriesStatus: mockGetWatchlistStatus,
      saveSeriesWatchlist: mockSaveSeriesWatchlist,
      removeSeriesWatchlist: mockRemoveSeriesWatchlist,
    );
    state = cubit.state;
  });

  const tId = 1;

  void arrangeUseCase() {
    when(mockGetSeriesDetail.execute(tId))
        .thenAnswer((_) async => Right(testSeriesDetail));
    when(mockGetRecommendationsSeries.execute(tId))
        .thenAnswer((_) async => Right(testSeriesList));
  }

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  group('Get Series Detail', () {
    blocTest<SeriesDetailCubit, SeriesDetailState>(
      'should get data detail from the use case',
      build: () {
        arrangeUseCase();
        return cubit;
      },
      act: (cubit) {
        state = cubit.state;
        cubit.fetchSeriesDetail(tId);
      },
      expect: () => <SeriesDetailState>[
        state.copyWith(seriesState: RequestState.loading),
        state.copyWith(
          seriesState: RequestState.loading,
          recommendationState: RequestState.loading,
          series: testSeriesDetail,
        ),
        state.copyWith(
          seriesState: RequestState.loaded,
          recommendationState: RequestState.loaded,
          series: testSeriesDetail,
          seriesRecommendations: testSeriesList,
        ),
      ],
    );

    blocTest<SeriesDetailCubit, SeriesDetailState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockGetSeriesDetail.execute(tId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        when(mockGetRecommendationsSeries.execute(tId))
            .thenAnswer((_) async => Right(testSeriesList));
        return cubit;
      },
      act: (cubit) {
        state = cubit.state;
        cubit.fetchSeriesDetail(tId);
      },
      expect: () => <SeriesDetailState>[
        state.copyWith(seriesState: RequestState.loading),
        state.copyWith(
          seriesState: RequestState.error,
          message: 'Server Failure',
        ),
      ],
    );
  });

  group('Watchlist', () {
    blocTest<SeriesDetailCubit, SeriesDetailState>(
      'should get the watchlist status',
      build: () {
        state = cubit.state;
        when(mockGetWatchlistStatus.execute(1)).thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.loadWatchlistStatus(1),
      expect: () => <SeriesDetailState>[
        state.copyWith(isAddedToWatchlist: true),
      ],
    );

    blocTest<SeriesDetailCubit, SeriesDetailState>(
      'should execute save watchlist when function called',
      build: () {
        state = cubit.state;
        when(mockSaveSeriesWatchlist.execute(testSeriesDetail))
            .thenAnswer((_) async => const Right('Success'));
        when(mockGetWatchlistStatus.execute(testSeriesDetail.id))
            .thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.addWatchlist(testSeriesDetail),
      expect: () => <SeriesDetailState>[
        state.copyWith(isAddedToWatchlist: false, watchlistMessage: 'Success'),
        state.copyWith(isAddedToWatchlist: true, watchlistMessage: 'Success'),
      ],
    );

    blocTest<SeriesDetailCubit, SeriesDetailState>(
      'should execute remove watchlist when function called',
      build: () {
        state = cubit.state;
        when(mockRemoveSeriesWatchlist.execute(testSeriesDetail))
            .thenAnswer((_) async => const Right('Removed'));
        when(mockGetWatchlistStatus.execute(testSeriesDetail.id))
            .thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.removeFromWatchlist(testSeriesDetail),
      expect: () => <SeriesDetailState>[
        state.copyWith(isAddedToWatchlist: false, watchlistMessage: 'Removed'),
      ],
    );
  });
}
