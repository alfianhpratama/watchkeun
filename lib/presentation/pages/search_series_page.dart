import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/constants.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/presentation/controller/series_search_controller/series_search_cubit.dart';
import 'package:watchkeun/presentation/widgets/series_card_list.dart';

class SearchSeriesPage extends StatelessWidget {
  static const routeName = '/search-series';

  const SearchSeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SeriesSearchCubit>();
    FirebaseAnalytics.instance.logScreenView(
      screenName: 'Search Series',
      screenClass: 'SearchSeriesPage',
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Search - Series')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: cubit.fetchSeriesSearch,
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text('Search Result', style: kHeading6),
            BlocBuilder<SeriesSearchCubit, SeriesSearchState>(
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
                        final series = data.searchResult[index];
                        return SeriesCard(series: series);
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
