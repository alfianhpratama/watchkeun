import 'package:equatable/equatable.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/domain/entities/movie_detail.dart';

class MovieTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  const MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory MovieTable.fromEntity(MovieDetail movie) {
    return MovieTable(
      id: movie.id,
      title: movie.title,
      posterPath: movie.posterPath,
      overview: movie.overview,
    );
  }

  factory MovieTable.fromMap(Map<String, dynamic> map) {
    return MovieTable(
      id: map['id'],
      title: map['title'],
      posterPath: map['posterPath'],
      overview: map['overview'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
      };

  Movie toEntity() => Movie.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
