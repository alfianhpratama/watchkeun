import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/common/utils.dart';
import 'package:watchkeun/presentation/controller/watchlist_series_controller/watchlist_series_cubit.dart';
import 'package:watchkeun/presentation/widgets/series_card_list.dart';

class WatchlistSeriesPage extends StatefulWidget {
  static const routeName = '/watchlist-series';

  const WatchlistSeriesPage({super.key});

  @override
  State<WatchlistSeriesPage> createState() => _WatchlistSeriesPageState();
}

class _WatchlistSeriesPageState extends State<WatchlistSeriesPage>
    with RouteAware {
  late WatchlistSeriesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<WatchlistSeriesCubit>();
    Future.microtask(() {
      _cubit.fetchWatchlistSeries();
      FirebaseAnalytics.instance.logScreenView(
        screenName: 'Watchlist Series',
        screenClass: 'WatchlistSeriesPage',
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() => _cubit.fetchWatchlistSeries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watchlist - Series')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistSeriesCubit, WatchlistSeriesState>(
          builder: (context, data) {
            if (data.watchlistState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.watchlistState == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = data.watchlistSeries[index];
                  return SeriesCard(series: series);
                },
                itemCount: data.watchlistSeries.length,
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
