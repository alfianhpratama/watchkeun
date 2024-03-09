import 'package:equatable/equatable.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';

class SeriesTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  const SeriesTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory SeriesTable.fromEntity(SeriesDetail series) {
    return SeriesTable(
      id: series.id,
      title: series.title,
      posterPath: series.posterPath,
      overview: series.overview,
    );
  }

  factory SeriesTable.fromMap(Map<String, dynamic> map) {
    return SeriesTable(
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

  Series toEntity() =>
      Series(id: id, overview: overview, posterPath: posterPath, title: title);

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
