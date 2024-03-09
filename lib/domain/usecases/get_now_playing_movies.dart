import 'package:dartz/dartz.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/repositories/movie_repository.dart';
import 'package:watchkeun/common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
