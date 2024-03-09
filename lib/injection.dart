import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:watchkeun/data/datasources/db/database_helper.dart';
import 'package:watchkeun/data/datasources/movie_local_data_source.dart';
import 'package:watchkeun/data/datasources/movie_remote_data_source.dart';
import 'package:watchkeun/data/datasources/series_local_data_source.dart';
import 'package:watchkeun/data/datasources/series_remote_data_source.dart';
import 'package:watchkeun/data/repositories/movie_repository_impl.dart';
import 'package:watchkeun/data/repositories/series_repository_impl.dart';
import 'package:watchkeun/domain/repositories/movie_repository.dart';
import 'package:watchkeun/domain/repositories/series_reporitory.dart';
import 'package:watchkeun/domain/usecases/get_movie_detail.dart';
import 'package:watchkeun/domain/usecases/get_movie_recommendations.dart';
import 'package:watchkeun/domain/usecases/get_now_playing_movies.dart';
import 'package:watchkeun/domain/usecases/get_on_air_series.dart';
import 'package:watchkeun/domain/usecases/get_popular_movies.dart';
import 'package:watchkeun/domain/usecases/get_popular_series.dart';
import 'package:watchkeun/domain/usecases/get_recommendations_series.dart';
import 'package:watchkeun/domain/usecases/get_series_detail.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_movies.dart';
import 'package:watchkeun/domain/usecases/get_top_rated_series.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_movies.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_series.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_series_status.dart';
import 'package:watchkeun/domain/usecases/get_watchlist_status.dart';
import 'package:watchkeun/domain/usecases/remove_series_watchlist.dart';
import 'package:watchkeun/domain/usecases/remove_watchlist.dart';
import 'package:watchkeun/domain/usecases/save_series_watchlist.dart';
import 'package:watchkeun/domain/usecases/save_watchlist.dart';
import 'package:watchkeun/domain/usecases/search_movies.dart';
import 'package:watchkeun/domain/usecases/search_series.dart';
import 'package:watchkeun/presentation/controller/movie_detail_controller/movie_detail_cubit.dart';
import 'package:watchkeun/presentation/controller/movie_list_controller/movie_list_cubit.dart';
import 'package:watchkeun/presentation/controller/movie_search_controller/movie_search_cubit.dart';
import 'package:watchkeun/presentation/controller/popular_movies_controller/popular_movies_cubit.dart';
import 'package:watchkeun/presentation/controller/series_detail_controller/series_detail_cubit.dart';
import 'package:watchkeun/presentation/controller/series_list_controller/series_list_cubit.dart';
import 'package:watchkeun/presentation/controller/series_list_popular_controller/series_list_popular_cubit.dart';
import 'package:watchkeun/presentation/controller/series_list_top_rated_controller/series_list_top_rated_cubit.dart';
import 'package:watchkeun/presentation/controller/series_search_controller/series_search_cubit.dart';
import 'package:watchkeun/presentation/controller/top_rated_movies_controller/top_rated_movies_cubit.dart';
import 'package:watchkeun/presentation/controller/watchlist_movie_controller/watchlist_movie_cubit.dart';
import 'package:watchkeun/presentation/controller/watchlist_series_controller/watchlist_series_cubit.dart';

final locator = GetIt.instance;

void init() {
  //cubit
  locator.registerFactory(
    () => MovieDetailCubit(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieListCubit(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchCubit(searchMovies: locator()),
  );
  locator.registerFactory(
    () => PopularMoviesCubit(getPopularMovies: locator()),
  );
  locator.registerFactory(
    () => SeriesDetailCubit(
      getSeriesDetail: locator(),
      getRecommendationsSeries: locator(),
      getWatchListSeriesStatus: locator(),
      saveSeriesWatchlist: locator(),
      removeSeriesWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => SeriesListCubit(
      getOnAirSeries: locator(),
      getPopularSeries: locator(),
      getTopRatedSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => SeriesListPopularCubit(getPopularSeries: locator()),
  );
  locator.registerFactory(
    () => SeriesListTopRatedCubit(getTopRatedSeries: locator()),
  );
  locator.registerFactory(
    () => SeriesSearchCubit(searchSeries: locator()),
  );
  locator.registerFactory(
    () => TopRatedMoviesCubit(getTopRatedMovies: locator()),
  );
  locator.registerFactory(
    () => WatchlistMovieCubit(getWatchlistMovies: locator()),
  );
  locator.registerFactory(
    () => WatchlistSeriesCubit(getWatchlistSeries: locator()),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetOnAirSeries(locator()));
  locator.registerLazySingleton(() => GetPopularSeries(locator()));
  locator.registerLazySingleton(() => GetRecommendationsSeries(locator()));
  locator.registerLazySingleton(() => GetSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTopRatedSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistSeries(locator()));
  locator.registerLazySingleton(() => GetWatchListSeriesStatus(locator()));
  locator.registerLazySingleton(() => RemoveSeriesWatchlist(locator()));
  locator.registerLazySingleton(() => SaveSeriesWatchlist(locator()));
  locator.registerLazySingleton(() => SearchSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<SeriesRepository>(
    () => SeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<SeriesRemoteDataSource>(
      () => SeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<SeriesLocalDataSource>(
      () => SeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
