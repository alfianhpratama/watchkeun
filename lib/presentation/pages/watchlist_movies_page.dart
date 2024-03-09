import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/common/utils.dart';
import 'package:watchkeun/presentation/controller/watchlist_movie_controller/watchlist_movie_cubit.dart';
import 'package:watchkeun/presentation/widgets/movie_card_list.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const routeName = '/watchlist-movie';

  const WatchlistMoviesPage({super.key});

  @override
  State<WatchlistMoviesPage> createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  late WatchlistMovieCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<WatchlistMovieCubit>();
    Future.microtask(() {
      _cubit.fetchWatchlistMovies();
      FirebaseAnalytics.instance.logScreenView(
        screenName: 'Watchlist Movies',
        screenClass: 'WatchlistMoviesPage',
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() => _cubit.fetchWatchlistMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watchlist - Movies')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistMovieCubit, WatchlistMovieState>(
          builder: (context, data) {
            if (data.watchlistState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.watchlistState == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = data.watchlistMovies[index];
                  return MovieCard(movie: movie);
                },
                itemCount: data.watchlistMovies.length,
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message ?? ''),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
