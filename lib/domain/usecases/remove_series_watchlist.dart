import 'package:dartz/dartz.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';
import 'package:watchkeun/domain/repositories/series_reporitory.dart';

class RemoveSeriesWatchlist {
  final SeriesRepository repository;

  RemoveSeriesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(SeriesDetail series) {
    return repository.removeWatchlist(series);
  }
}
