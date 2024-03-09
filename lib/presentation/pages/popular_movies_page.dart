import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/presentation/controller/popular_movies_controller/popular_movies_cubit.dart';
import 'package:watchkeun/presentation/widgets/movie_card_list.dart';

class PopularMoviesPage extends StatefulWidget {
  static const routeName = '/popular-movie';

  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  late PopularMoviesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<PopularMoviesCubit>();
    Future.microtask(() => _cubit.fetchPopularMovies());
    FirebaseAnalytics.instance.logScreenView(
      screenName: 'Popular Movies',
      screenClass: 'PopularMoviesPage',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Movies')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, data) {
            if (data.state == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.state == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = data.movies[index];
                  return MovieCard(movie: movie);
                },
                itemCount: data.movies.length,
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
}
