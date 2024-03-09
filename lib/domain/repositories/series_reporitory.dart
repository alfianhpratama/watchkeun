import 'package:dartz/dartz.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';

abstract class SeriesRepository {
  Future<Either<Failure, List<Series>>> getOnAirSeries();

  Future<Either<Failure, List<Series>>> getPopularSeries();

  Future<Either<Failure, List<Series>>> getTopRatedSeries();

  Future<Either<Failure, SeriesDetail>> getSeriesDetail(int id);

  Future<Either<Failure, List<Series>>> getSeriesRecommendations(int id);

  Future<Either<Failure, List<Series>>> searchSeries(String query);

  Future<Either<Failure, String>> saveWatchlist(SeriesDetail movie);

  Future<Either<Failure, String>> removeWatchlist(SeriesDetail movie);

  Future<bool> isAddedToWatchlist(int id);

  Future<Either<Failure, List<Series>>> getWatchlistSeries();
}
