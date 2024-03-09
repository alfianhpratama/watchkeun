import 'package:dartz/dartz.dart';
import 'package:watchkeun/common/failure.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getPopularMovies();
  }
}
