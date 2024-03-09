import 'package:dartz/dartz.dart';
import 'package:watchkeun/domain/entities/movie_detail.dart';
import 'package:watchkeun/domain/repositories/movie_repository.dart';
import 'package:watchkeun/common/failure.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
