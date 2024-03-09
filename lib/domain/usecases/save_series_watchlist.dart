import 'package:dartz/dartz.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';
import 'package:watchkeun/domain/repositories/series_reporitory.dart';

class SaveSeriesWatchlist {
  final SeriesRepository repository;

  SaveSeriesWatchlist(this.repository);

  Future<Either<Failure, String>> execute(SeriesDetail series) {
    return repository.saveWatchlist(series);
  }
}
