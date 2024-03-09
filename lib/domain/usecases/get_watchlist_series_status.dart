import 'package:watchkeun/domain/repositories/series_reporitory.dart';

class GetWatchListSeriesStatus {
  final SeriesRepository repository;

  GetWatchListSeriesStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
