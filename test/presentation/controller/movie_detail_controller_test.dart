import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/get_movie_detail.dart';
import 'package:watchkeun/domain/usecases/get_movie_recommendations.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_status.dart';
import 'package:watchkeun/domain/usecases/remove_watchlist.dart';
import 'package:watchkeun/domain/usecases/save_watchlist.dart';
import 'package:watchkeun/presentation/controller/movie_detail_controller/movie_detail_cubit.dart';
import 'package:watchkeun/common/state_enum.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_controller_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MovieDetailCubit cubit;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MovieDetailState state;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    cubit = MovieDetailCubit(
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
      getWatchListStatus: mockGetWatchlistStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
    state = cubit.state;
  });

  const tId = 1;

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovies = <Movie>[tMovie];

  void arrangeUseCase() {
    when(mockGetMovieDetail.execute(tId))
        .thenAnswer((_) async => const Right(testMovieDetail));
    when(mockGetMovieRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tMovies));
  }

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  group('Get Movie Detail', () {
    blocTest<MovieDetailCubit, MovieDetailState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockGetMovieDetail.execute(tId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tMovies));
        return cubit;
      },
      act: (cubit) {
        state = cubit.state;
        cubit.fetchMovieDetail(tId);
      },
      expect: () => <MovieDetailState>[
        state.copyWith(movieState: RequestState.loading),
        state.copyWith(
          movieState: RequestState.error,
          message: 'Server Failure',
        ),
      ],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'should get data detail from the use case',
      build: () {
        arrangeUseCase();
        return cubit;
      },
      act: (cubit) {
        state = cubit.state;
        cubit.fetchMovieDetail(tId);
      },
      expect: () => <MovieDetailState>[
        state.copyWith(movieState: RequestState.loading),
        state.copyWith(
          movieState: RequestState.loading,
          recommendationState: RequestState.loading,
          movie: testMovieDetail,
        ),
        state.copyWith(
          movieState: RequestState.loaded,
          recommendationState: RequestState.loaded,
          movie: testMovieDetail,
          movieRecommendations: tMovies,
        ),
      ],
    );
  });

  group('Watchlist', () {
    blocTest<MovieDetailCubit, MovieDetailState>(
      'should get the watchlist status',
      build: () {
        state = cubit.state;
        when(mockGetWatchlistStatus.execute(1)).thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.loadWatchlistStatus(1),
      expect: () => <MovieDetailState>[
        state.copyWith(isAddedToWatchlist: true),
      ],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'should execute save watchlist when function called',
      build: () {
        state = cubit.state;
        when(mockSaveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Success'));
        when(mockGetWatchlistStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.addWatchlist(testMovieDetail),
      expect: () => <MovieDetailState>[
        state.copyWith(isAddedToWatchlist: false, watchlistMessage: 'Success'),
        state.copyWith(isAddedToWatchlist: true, watchlistMessage: 'Success'),
      ],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'should execute remove watchlist when function called',
      build: () {
        state = cubit.state;
        when(mockRemoveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Removed'));
        when(mockGetWatchlistStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.removeFromWatchlist(testMovieDetail),
      expect: () => <MovieDetailState>[
        state.copyWith(isAddedToWatchlist: false, watchlistMessage: 'Removed'),
      ],
    );
  });
}
