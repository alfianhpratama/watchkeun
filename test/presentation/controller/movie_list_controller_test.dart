import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/get_now_playing_movies.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/usecases/get_popular_movies.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_movies.dart';
import 'package:watchkeun/presentation/controller/movie_list_controller/movie_list_cubit.dart';
import 'package:watchkeun/common/state_enum.dart';

import 'movie_list_controller_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies, GetPopularMovies, GetTopRatedMovies])
void main() {
  late MovieListCubit cubit;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MovieListState state;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    cubit = MovieListCubit(
      getNowPlayingMovies: mockGetNowPlayingMovies,
      getPopularMovies: mockGetPopularMovies,
      getTopRatedMovies: mockGetTopRatedMovies,
    );
    state = cubit.state;
  });

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
  final tMovieList = <Movie>[tMovie];

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  group('now playing movies', () {
    blocTest<MovieListCubit, MovieListState>(
      'should get data from the use case',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return cubit;
      },
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      expect: () => <MovieListState>[
        state.copyWith(nowPlayingState: RequestState.loading),
        state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: tMovieList,
        ),
      ],
    );

    blocTest<MovieListCubit, MovieListState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockGetNowPlayingMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      expect: () => <MovieListState>[
        state.copyWith(nowPlayingState: RequestState.loading),
        state.copyWith(
          nowPlayingState: RequestState.error,
          message: 'Server Failure',
        ),
      ],
    );
  });

  group('popular movies', () {
    blocTest<MovieListCubit, MovieListState>(
      'should get data from the use case',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return cubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      expect: () => <MovieListState>[
        state.copyWith(popularMoviesState: RequestState.loading),
        state.copyWith(
          popularMoviesState: RequestState.loaded,
          popularMovies: tMovieList,
        ),
      ],
    );

    blocTest<MovieListCubit, MovieListState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockGetPopularMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      expect: () => <MovieListState>[
        state.copyWith(popularMoviesState: RequestState.loading),
        state.copyWith(
          popularMoviesState: RequestState.error,
          message: 'Server Failure',
        ),
      ],
    );
  });

  group('top rated movies', () {
    blocTest<MovieListCubit, MovieListState>(
      'should get data from the use case',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => <MovieListState>[
        state.copyWith(topRatedMoviesState: RequestState.loading),
        state.copyWith(
          topRatedMoviesState: RequestState.loaded,
          topRatedMovies: tMovieList,
        ),
      ],
    );

    blocTest<MovieListCubit, MovieListState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockGetTopRatedMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => <MovieListState>[
        state.copyWith(topRatedMoviesState: RequestState.loading),
        state.copyWith(
          topRatedMoviesState: RequestState.error,
          message: 'Server Failure',
        ),
      ],
    );
  });
}
