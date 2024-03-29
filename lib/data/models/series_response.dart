import 'package:equatable/equatable.dart';
import 'package:watchkeun/data/models/series_model.dart';

class SeriesResponse extends Equatable {
  final List<SeriesModel> seriesList;

  const SeriesResponse({required this.seriesList});

  factory SeriesResponse.fromJson(Map<String, dynamic> json) => SeriesResponse(
      seriesList: json["results"] == null
          ? []
          : List<SeriesModel>.from(
              json["results"]!
                  .map((x) => SeriesModel.fromJson(x))
                  .where((element) => element.posterPath != null),
            ));

  Map<String, dynamic> toJson() =>
      {"results": List<dynamic>.from(seriesList.map((x) => x.toJson()))};

  @override
  List<Object> get props => [seriesList];
}
