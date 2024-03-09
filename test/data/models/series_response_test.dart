import 'package:flutter_test/flutter_test.dart';
import 'package:watchkeun/data/models/series_model.dart';
import 'package:watchkeun/data/models/series_response.dart';

void main() {
  const tSeriesResponseJson = {
    'results': [
      {
        'adult': false,
        'backdrop_path': 'backdropPath',
        'id': 1,
        'overview': 'overview',
        'popularity': 1,
        'poster_path': 'posterPath',
        'name': 'title',
        'vote_average': 1,
        'vote_count': 1,
      }
    ]
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

  const tSeriesResponse = [tSeriesModel];

  test('should be a subclass of Series Response entity', () async {
    final fSeriesResponse = SeriesResponse.fromJson(tSeriesResponseJson);
    final json = fSeriesResponse.toJson();
    expect(fSeriesResponse.seriesList, tSeriesResponse);
    expect(json['id'], equals(tSeriesResponseJson['id']));
  });
}
