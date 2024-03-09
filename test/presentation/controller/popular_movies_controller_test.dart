import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/get_popular_movies.dart';
import 'package:watchkeun/presentation/controller/popular_movies_controller/popular_movies_cubit.dart';

import 'popular_movies_controller_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late MockGetPopularMovies mockGetPopularMovies;
  late PopularMoviesCubit cubit;
  late PopularMoviesState state;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    cubit = PopularMoviesCubit(getPopularMovies: mockGetPopularMovies);
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

  blocTest<PopularMoviesCubit, PopularMoviesState>(
    'should get result data when data is gotten successfully',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return cubit;
    },
    act: (bloc) => cubit.fetchPopularMovies(),
    expect: () => <PopularMoviesState>[
      state.copyWith(state: RequestState.loading),
      state.copyWith(state: RequestState.loaded, movies: tMovieList),
    ],
  );

  blocTest<PopularMoviesCubit, PopularMoviesState>(
    'should return error when data is unsuccessful',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (bloc) => cubit.fetchPopularMovies(),
    expect: () => <PopularMoviesState>[
      state.copyWith(state: RequestState.loading),
      state.copyWith(state: RequestState.error, message: 'Server Failure'),
    ],
  );
}
