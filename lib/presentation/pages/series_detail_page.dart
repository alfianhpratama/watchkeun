import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:watchkeun/common/constants.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/domain/entities/series.dart';
import 'package:watchkeun/domain/entities/series_detail.dart';
import 'package:watchkeun/presentation/controller/series_detail_controller/series_detail_cubit.dart';

class SeriesDetailPage extends StatefulWidget {
  static const routeName = '/detail-series';
  final int id;

  const SeriesDetailPage({super.key, required this.id});

  @override
  State<SeriesDetailPage> createState() => _SeriesDetailPageState();
}

class _SeriesDetailPageState extends State<SeriesDetailPage> {
  late SeriesDetailCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SeriesDetailCubit>();
    Future.microtask(() {
      _cubit
        ..fetchSeriesDetail(widget.id)
        ..loadWatchlistStatus(widget.id);
      FirebaseAnalytics.instance.logScreenView(
        screenName: 'Series Detail',
        screenClass: 'SeriesDetailPage',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SeriesDetailCubit, SeriesDetailState>(
        builder: (context, state) {
          if (state.seriesState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.seriesState == RequestState.loaded) {
            final series = state.series;
            return SafeArea(
              child: DetailContent(
                series: series!,
                recommendations: state.seriesRecommendations,
                isAddedWatchlist: state.isAddedToWatchlist,
              ),
            );
          } else {
            return Text(state.message ?? '');
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final SeriesDetail series;
  final List<Series> recommendations;
  final bool isAddedWatchlist;

  const DetailContent({
    super.key,
    required this.series,
    required this.recommendations,
    required this.isAddedWatchlist,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cubit = context.read<SeriesDetailCubit>();
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$baseImageURL${series.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              series.title ?? '',
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (!isAddedWatchlist) {
                                  cubit
                                      .addWatchlist(series)
                                      .then((_) => _doNext(context, cubit));
                                } else {
                                  cubit
                                      .removeFromWatchlist(series)
                                      .then((_) => _doNext(context, cubit));
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(series.genres.join(', ')),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: (series.voteAverage ?? 0.0) / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${series.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text('Overview', style: kHeading6),
                            Text(series.overview ?? ''),
                            const SizedBox(height: 16),
                            Text('Recommendations', style: kHeading6),
                            BlocBuilder<SeriesDetailCubit, SeriesDetailState>(
                              builder: (context, data) {
                                if (data.recommendationState ==
                                    RequestState.loading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (data.recommendationState ==
                                    RequestState.error) {
                                  return Text(data.message ?? '');
                                } else if (data.recommendationState ==
                                    RequestState.loaded) {
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final series = recommendations[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                SeriesDetailPage.routeName,
                                                arguments: series.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '$baseImageURL${series.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations.length,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        )
      ],
    );
  }

  void _doNext(BuildContext context, SeriesDetailCubit cubit) {
    final message = cubit.state.watchlistMessage ?? '';

    if (message == SeriesDetailCubit.watchlistAddSuccessMessage ||
        message == SeriesDetailCubit.watchlistRemoveSuccessMessage) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text(message)),
      );
    }
  }
}
