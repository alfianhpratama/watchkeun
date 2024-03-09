import 'package:equatable/equatable.dart';
import 'package:watchkeun/data/models/genre_model.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';

class SeriesModel extends Equatable {
  final int id;
  final bool? adult;
  final String? backdropPath;
  final List<int>? episodeRunTime;
  final DateTime? firstAirDate;
  final List<GenreModel>? genres;
  final String? homepage;
  final bool? inProduction;
  final List<String>? languages;
  final DateTime? lastAirDate;
  final String? name;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;
  final List<int>? genreIds;

  const SeriesModel({
    required this.id,
    this.adult,
    this.backdropPath,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.name,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      episodeRunTime: json["episode_run_time"] == null
          ? []
          : List<int>.from(json["episode_run_time"]!.map((x) => x)),
      firstAirDate: json["first_air_date"] == null
          ? null
          : DateTime.tryParse(json["first_air_date"]),
      genres: json["genres"] == null
          ? []
          : List<GenreModel>.from(
              json["genres"]!.map((x) => GenreModel.fromJson(x))),
      homepage: json["homepage"],
      id: json["id"],
      inProduction: json["in_production"],
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      lastAirDate: json["last_air_date"] == null
          ? null
          : DateTime.parse(json["last_air_date"]),
      name: json["name"],
      numberOfEpisodes: json["number_of_episodes"],
      numberOfSeasons: json["number_of_seasons"],
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"],
      originalName: json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"]?.toDouble(),
      posterPath: json["poster_path"],
      status: json["status"],
      tagline: json["tagline"],
      type: json["type"],
      voteAverage: json["vote_average"]?.toDouble(),
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "adult": adult,
      "backdrop_path": backdropPath,
      "episode_run_time": episodeRunTime == null
          ? []
          : List<dynamic>.from(episodeRunTime!.map((x) => x)),
      "first_air_date": firstAirDate == null
          ? null
          : "${firstAirDate!.year.toString().padLeft(4, '0')}-"
              "${firstAirDate!.month.toString().padLeft(2, '0')}-"
              "${firstAirDate!.day.toString().padLeft(2, '0')}",
      "genres": genres == null
          ? []
          : List<dynamic>.from(genres!.map((x) => x.toJson())),
      "homepage": homepage,
      "id": id,
      "in_production": inProduction,
      "languages":
          languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
      "last_air_date": lastAirDate == null
          ? null
          : "${lastAirDate!.year.toString().padLeft(4, '0')}-"
              "${lastAirDate!.month.toString().padLeft(2, '0')}-"
              "${lastAirDate!.day.toString().padLeft(2, '0')}",
      "number_of_episodes": numberOfEpisodes,
      "number_of_seasons": numberOfSeasons,
      "origin_country": originCountry == null
          ? []
          : List<dynamic>.from(originCountry!.map((x) => x)),
      "original_language": originalLanguage,
      "original_name": originalName,
      "overview": overview,
      "popularity": popularity,
      "poster_path": posterPath,
      "status": status,
      "tagline": tagline,
      "type": type,
      "vote_average": voteAverage,
      "vote_count": voteCount,
      "genre_ids":
          genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
      "name": name,
    };
  }

  Series toEntity() {
    return Series(
      id: id,
      adult: adult,
      backdropPath: backdropPath,
      title: name != originalName ? "$name ($originalName)" : name,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  SeriesDetail toDetailEntity() {
    String title = "$name";
    if (name != originalName) title = "$name ($originalName)";

    return SeriesDetail(
      id: id,
      backdropPath: backdropPath,
      title: title,
      overview: overview,
      posterPath: posterPath,
      voteAverage: voteAverage,
      genres: genres?.map((e) => e.name).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
