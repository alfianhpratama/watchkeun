import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/constants.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/presentation/controller/series_list_controller/series_list_cubit.dart';
import 'package:watchkeun/presentation/pages/search_series_page.dart';
import 'package:watchkeun/presentation/pages/series_detail_page.dart';
import 'package:watchkeun/presentation/pages/series_list_popular_page.dart';
import 'package:watchkeun/presentation/pages/series_list_top_rated_page.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/presentation/widgets/drawer_view.dart';

class SeriesPage extends StatefulWidget {
  static const routeName = '/series';

  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  late SeriesListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SeriesListCubit>();
    _refreshPage();
  }

  void _refreshPage() {
    Future.microtask(() {
      _cubit
        ..fetchOnAirSeries()
        ..fetchPopularSeries()
        ..fetchTopRatedSeries();
      FirebaseAnalytics.instance.logScreenView(
        screenName: 'Series',
        screenClass: 'SeriesPage',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(onRefresh: _refreshPage, isMovie: false),
      appBar: AppBar(
        title: const Text('WatchKeun - TV Series'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              SearchSeriesPage.routeName,
            ),
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
              Text('On The Air', style: kHeading6),
              BlocBuilder<SeriesListCubit, SeriesListState>(
                builder: (context, data) {
                  final state = data.onAirState;
                  if (state == RequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return SeriesList(seriesList: data.onAirSeries);
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
              BuildSubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(
                  context,
                  SeriesPopularPage.routeName,
                ),
              ),
              BlocBuilder<SeriesListCubit, SeriesListState>(
                builder: (context, data) {
                  final state = data.popularSeriesState;
                  if (state == RequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return SeriesList(seriesList: data.popularSeries);
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
              BuildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(
                  context,
                  SeriesTopRatedPage.routeName,
                ),
              ),
              BlocBuilder<SeriesListCubit, SeriesListState>(
                builder: (context, data) {
                  final state = data.topRatedSeriesState;
                  if (state == RequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return SeriesList(seriesList: data.topRatedSeries);
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

class SeriesList extends StatelessWidget {
  final List<Series> seriesList;

  const SeriesList({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final series = seriesList[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SeriesDetailPage.routeName,
                  arguments: series.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageURL${series.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: seriesList.length,
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
