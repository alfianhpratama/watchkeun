import 'package:flutter_test/flutter_test.dart';
import 'package:watchkeun/data/models/series_model.dart';
import 'package:watchkeun/domain/entities/series.dart';

void main() {
  const tSeriesModelJson = {
    'adult': false,
    'backdrop_path': 'backdropPath',
    'id': 1,
    'overview': 'overview',
    'popularity': 1,
    'poster_path': 'posterPath',
    'name': 'title',
    'vote_average': 1,
    'vote_count': 1,
  };
  const tSeriesModel = SeriesModel(
    adult: false,
    backdropPath: 'backdropPath',
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    name: 'title',
    voteAverage: 1,
    voteCount: 1,
    genres: [],
    genreIds: [],
    episodeRunTime: [],
    languages: [],
    originCountry: [],
  );

  const tSeries = Series(
    adult: false,
    backdropPath: 'backdropPath',
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    title: 'title (null)',
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Series entity', () async {
    final json = SeriesModel.fromJson(tSeriesModelJson);
    final result = tSeriesModel.toEntity();
    expect(json, tSeriesModel);
    expect(result, tSeries);
  });
}
