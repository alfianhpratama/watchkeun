import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/constants.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/presentation/controller/movie_search_controller/movie_search_cubit.dart';
import 'package:watchkeun/presentation/widgets/movie_card_list.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieSearchCubit>();
    FirebaseAnalytics.instance.logScreenView(
      screenName: 'Search',
      screenClass: 'SearchPage',
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Search - Movies')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: cubit.fetchMovieSearch,
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text('Search Result', style: kHeading6),
            BlocBuilder<MovieSearchCubit, MovieSearchState>(
              builder: (context, data) {
                if (data.state == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.state == RequestState.loaded) {
                  final result = data.searchResult;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = data.searchResult[index];
                        return MovieCard(movie: movie);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return Expanded(child: Container());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
