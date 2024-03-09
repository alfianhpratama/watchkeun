import 'package:dartz/dartz.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';
import 'package:watchkeun/domain/repositories/series_reporitory.dart';

class GetSeriesDetail {
  final SeriesRepository repository;

  GetSeriesDetail(this.repository);

  Future<Either<Failure, SeriesDetail>> execute(int id) =>
      repository.getSeriesDetail(id);
}
