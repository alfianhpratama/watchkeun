import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_movies.dart';
import 'package:watchkeun/presentation/controller/top_rated_movies_controller/top_rated_movies_cubit.dart';

import 'top_rated_movies_controller_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedMoviesCubit cubit;
  late TopRatedMoviesState state;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    cubit = TopRatedMoviesCubit(getTopRatedMovies: mockGetTopRatedMovies);
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

  blocTest<TopRatedMoviesCubit, TopRatedMoviesState>(
    'should get result data when data is gotten successfully',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return cubit;
    },
    act: (bloc) => cubit.fetchTopRatedMovies(),
    expect: () => <TopRatedMoviesState>[
      state.copyWith(state: RequestState.loading),
      state.copyWith(state: RequestState.loaded, movies: tMovieList),
    ],
  );

  blocTest<TopRatedMoviesCubit, TopRatedMoviesState>(
    'should return error when data is unsuccessful',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (bloc) => cubit.fetchTopRatedMovies(),
    expect: () => <TopRatedMoviesState>[
      state.copyWith(state: RequestState.loading),
      state.copyWith(state: RequestState.error, message: 'Server Failure'),
    ],
  );
}
