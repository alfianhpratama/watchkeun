import 'package:dartz/dartz.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/repositories/movie_repository.dart';
import 'package:watchkeun/common/failure.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
