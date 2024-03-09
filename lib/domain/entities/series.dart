import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final int id;
  final bool? adult;
  final String? backdropPath;
  final String? title;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;

  const Series({
    required this.id,
    this.adult,
    this.backdropPath,
    this.title,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        adult,
        backdropPath,
        title,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount
      ];
}
