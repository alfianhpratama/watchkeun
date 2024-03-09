import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/usecases/search_movies.dart';
import 'package:watchkeun/presentation/controller/movie_search_controller/movie_search_cubit.dart';

import 'movie_search_controller_test.mocks.dart';

@GenerateMocks([SearchMovies])
void main() {
  late MovieSearchCubit cubit;
  late MockSearchMovies mockSearchMovies;
  late MovieSearchState state;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    cubit = MovieSearchCubit(searchMovies: mockSearchMovies);
    state = cubit.state;
  });

  final tMovieModel = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: const [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovieList = <Movie>[tMovieModel];
  const tQuery = 'spiderman';

  test('initialState should be default state', () {
    expect(cubit.state, equals(state));
  });

  group('search movies', () {
    blocTest<MovieSearchCubit, MovieSearchState>(
      'should change search result data when data is gotten successfully',
      build: () {
        when(mockSearchMovies.execute(tQuery))
            .thenAnswer((_) async => Right(tMovieList));
        return cubit;
      },
      act: (bloc) => cubit.fetchMovieSearch(tQuery),
      expect: () => <MovieSearchState>[
        state.copyWith(state: RequestState.loading),
        state.copyWith(state: RequestState.loaded, searchResult: tMovieList),
      ],
    );

    blocTest<MovieSearchCubit, MovieSearchState>(
      'should return error when data is unsuccessful',
      build: () {
        when(mockSearchMovies.execute(tQuery)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return cubit;
      },
      act: (bloc) => cubit.fetchMovieSearch(tQuery),
      expect: () => <MovieSearchState>[
        state.copyWith(state: RequestState.loading),
        state.copyWith(state: RequestState.error, message: 'Server Failure'),
      ],
    );
  });
}
