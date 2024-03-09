import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/constants.dart';
import 'package:watchkeun/domain/entities/movie.dart';
import 'package:watchkeun/presentation/controller/movie_list_controller/movie_list_cubit.dart';
import 'package:watchkeun/presentation/pages/movie_detail_page.dart';
import 'package:watchkeun/presentation/pages/popular_movies_page.dart';
import 'package:watchkeun/presentation/pages/search_page.dart';
import 'package:watchkeun/presentation/pages/top_rated_movies_page.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/presentation/widgets/drawer_view.dart';

class HomeMoviePage extends StatefulWidget {
  static const routeName = '/';

  const HomeMoviePage({super.key});

  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  late MovieListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<MovieListCubit>();
    Future.microtask(() => _cubit
      ..fetchNowPlayingMovies()
      ..fetchPopularMovies()
      ..fetchTopRatedMovies());
    FirebaseAnalytics.instance.logScreenView(
      screenName: 'Home Page',
      screenClass: 'HomeMoviePage',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(
        onRefresh: () {
          Future.microtask(() => _cubit
            ..fetchNowPlayingMovies()
            ..fetchPopularMovies()
            ..fetchTopRatedMovies());
        },
        isMovie: true,
      ),
      appBar: AppBar(
        title: const Text('Ditonton - Movie'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, SearchPage.routeName),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Now Playing', style: kHeading6),
              BlocBuilder<MovieListCubit, MovieListState>(
                builder: (context, data) {
                  final state = data.nowPlayingState;
                  if (state == RequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return MovieList(movies: data.nowPlayingMovies);
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
              BuildSubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(
                  context,
                  PopularMoviesPage.routeName,
                ),
              ),
              BlocBuilder<MovieListCubit, MovieListState>(
                builder: (context, data) {
                  final state = data.popularMoviesState;
                  if (state == RequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return MovieList(movies: data.popularMovies);
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
              BuildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(
                  context,
                  TopRatedMoviesPage.routeName,
                ),
              ),
              BlocBuilder<MovieListCubit, MovieListState>(
                builder: (context, data) {
                  final state = data.topRatedMoviesState;
                  if (state == RequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return MovieList(movies: data.topRatedMovies);
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildSubHeading extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BuildSubHeading({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: kHeading6),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.routeName,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageURL${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
