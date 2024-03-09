import 'package:equatable/equatable.dart';

class SeriesDetail extends Equatable {
  final int id;
  final String? backdropPath;
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final List<String> genres;
  final DateTime? releaseDate;
  final String? status;
  final String? overview;

  const SeriesDetail({
    required this.id,
    this.backdropPath,
    this.posterPath,
    this.title,
    this.voteAverage,
    this.genres = const [],
    this.releaseDate,
    this.status,
    this.overview,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        posterPath,
        title,
        voteAverage,
        genres,
        releaseDate,
        status,
        overview
      ];
}
