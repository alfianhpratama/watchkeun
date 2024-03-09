import 'package:watchkeun/data/models/genre_model.dart';
import 'package:watchkeun/data/models/movie_table.dart';
import 'package:watchkeun/data/models/series_model.dart';
import 'package:watchkeun/data/models/series_table.dart';
import 'package:watchkeun/domain/entities/genre.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/entities/movie_detail.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';

final testMovie = Movie(
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

final testMovieList = [testMovie];

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

const testSeriesTable = SeriesTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

const testSeries = Series(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  id: 557,
  title: 'Spider-Man',
  overview: 'After being bitten by a genetically altered spider, '
      'nerdy high school student Peter Parker is endowed with amazing '
      'powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  voteAverage: 7.2,
  voteCount: 13507,
);

final testSeriesList = [
  testSeries,
  testSeries,
  testSeries,
  testSeries,
  testSeries,
  testSeries,
  testSeries,
  testSeries,
];

final testSeriesDetail = SeriesDetail(
  backdropPath: 'backdropPath',
  genres: const ['Action'],
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: DateTime(2024, 11, 21),
  title: 'title',
  voteAverage: 1,
  status: 'status',
);

const testWatchlistSeries = Series(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testSeriesModel = SeriesModel(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genres: const [GenreModel(id: 1, name: 'Action')],
  id: 557,
  name: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  voteAverage: 7.2,
  voteCount: 13507,
  episodeRunTime: const [],
  firstAirDate: DateTime(2024, 11, 21),
  homepage: '',
  inProduction: false,
  languages: const [],
  lastAirDate: DateTime(2024, 11, 21),
  numberOfEpisodes: null,
  numberOfSeasons: null,
  originCountry: null,
  originalLanguage: '',
  originalName: '',
  status: '',
  tagline: '',
  type: '',
);
