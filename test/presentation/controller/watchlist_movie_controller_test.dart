import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_movies.dart';
import 'package:watchkeun/presentation/controller/watchlist_movie_controller/watchlist_movie_cubit.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_movie_controller_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late WatchlistMovieCubit cubit;
  late WatchlistMovieState state;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    cubit = WatchlistMovieCubit(getWatchlistMovies: mockGetWatchlistMovies);
    state = cubit.state;
  });

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  blocTest<WatchlistMovieCubit, WatchlistMovieState>(
    'should change movies data when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right([testWatchlistMovie]));
      return cubit;
    },
    act: (cubit) => cubit.fetchWatchlistMovies(),
    expect: () => <WatchlistMovieState>[
      state.copyWith(watchlistState: RequestState.loading),
      state.copyWith(
        watchlistState: RequestState.loaded,
        watchlistMovies: [testWatchlistMovie],
      ),
    ],
  );

  blocTest<WatchlistMovieCubit, WatchlistMovieState>(
    'should return error when data is unsuccessful',
    build: () {
      when(mockGetWatchlistMovies.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure("Can't get data")));
      return cubit;
    },
    act: (cubit) => cubit.fetchWatchlistMovies(),
    expect: () => <WatchlistMovieState>[
      state.copyWith(watchlistState: RequestState.loading),
      state.copyWith(
        watchlistState: RequestState.error,
        message: "Can't get data",
      ),
    ],
  );
}
