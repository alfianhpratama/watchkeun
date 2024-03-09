import 'package:dartz/dartz.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/repositories/series_reporitory.dart';

class GetOnAirSeries {
  final SeriesRepository repository;

  GetOnAirSeries(this.repository);

  Future<Either<Failure, List<Series>>> execute() =>
      repository.getOnAirSeries();
}
