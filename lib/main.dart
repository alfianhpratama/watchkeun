import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/constants.dart';
import 'package:watchkeun/common/utils.dart';
import 'package:watchkeun/injection.dart' as di;
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
import 'package:watchkeun/presentation/pages/about_page.dart';
import 'package:watchkeun/presentation/pages/home_movie_page.dart';
import 'package:watchkeun/presentation/pages/movie_detail_page.dart';
import 'package:watchkeun/presentation/pages/popular_movies_page.dart';
import 'package:watchkeun/presentation/pages/search_page.dart';
import 'package:watchkeun/presentation/pages/search_series_page.dart';
import 'package:watchkeun/presentation/pages/series_detail_page.dart';
import 'package:watchkeun/presentation/pages/series_list_popular_page.dart';
import 'package:watchkeun/presentation/pages/series_list_top_rated_page.dart';
import 'package:watchkeun/presentation/pages/series_page.dart';
import 'package:watchkeun/presentation/pages/top_rated_movies_page.dart';
import 'package:watchkeun/presentation/pages/watchlist_movies_page.dart';
import 'package:watchkeun/presentation/pages/watchlist_series_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAnalytics.instance;
  di.init();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(!kDebugMode);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailCubit>(
          create: (ctx) => di.locator<MovieDetailCubit>(),
        ),
        BlocProvider<MovieListCubit>(
          create: (ctx) => di.locator<MovieListCubit>(),
        ),
        BlocProvider<MovieSearchCubit>(
          create: (ctx) => di.locator<MovieSearchCubit>(),
        ),
        BlocProvider<PopularMoviesCubit>(
          create: (ctx) => di.locator<PopularMoviesCubit>(),
        ),
        BlocProvider<SeriesDetailCubit>(
          create: (ctx) => di.locator<SeriesDetailCubit>(),
        ),
        BlocProvider<SeriesListCubit>(
          create: (ctx) => di.locator<SeriesListCubit>(),
        ),
        BlocProvider<SeriesListPopularCubit>(
          create: (ctx) => di.locator<SeriesListPopularCubit>(),
        ),
        BlocProvider<SeriesListTopRatedCubit>(
          create: (ctx) => di.locator<SeriesListTopRatedCubit>(),
        ),
        BlocProvider<SeriesSearchCubit>(
          create: (ctx) => di.locator<SeriesSearchCubit>(),
        ),
        BlocProvider<TopRatedMoviesCubit>(
          create: (ctx) => di.locator<TopRatedMoviesCubit>(),
        ),
        BlocProvider<WatchlistMovieCubit>(
          create: (ctx) => di.locator<WatchlistMovieCubit>(),
        ),
        BlocProvider<WatchlistSeriesCubit>(
          create: (ctx) => di.locator<WatchlistSeriesCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: const HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomeMoviePage.routeName:
              return MaterialPageRoute(builder: (_) => const HomeMoviePage());
            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.routeName:
              return CupertinoPageRoute(builder: (_) => const SearchPage());
            case WatchlistMoviesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistMoviesPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            case SeriesPage.routeName:
              return MaterialPageRoute(builder: (_) => const SeriesPage());
            case SeriesDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => SeriesDetailPage(id: id),
                settings: settings,
              );
            case SeriesPopularPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const SeriesPopularPage());
            case SeriesTopRatedPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const SeriesTopRatedPage());
            case WatchlistSeriesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const WatchlistSeriesPage());
            case SearchSeriesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const SearchSeriesPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
