import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:watchkeun/data/datasources/db/database_helper.dart';
import 'package:watchkeun/data/datasources/movie_local_data_source.dart';
import 'package:watchkeun/data/datasources/movie_remote_data_source.dart';
import 'package:watchkeun/data/datasources/series_local_data_source.dart';
import 'package:watchkeun/data/datasources/series_remote_data_source.dart';
import 'package:watchkeun/domain/repositories/movie_repository.dart';
import 'package:watchkeun/domain/repositories/series_reporitory.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  SeriesRepository,
  SeriesRemoteDataSource,
  SeriesLocalDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
