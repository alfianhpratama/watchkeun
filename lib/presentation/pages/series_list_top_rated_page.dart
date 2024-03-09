import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/presentation/controller/series_list_top_rated_controller/series_list_top_rated_cubit.dart';
import 'package:watchkeun/presentation/widgets/series_card_list.dart';

class SeriesTopRatedPage extends StatefulWidget {
  static const routeName = '/top-rated-series';

  const SeriesTopRatedPage({super.key});

  @override
  State<SeriesTopRatedPage> createState() => _SeriesTopRatedPageState();
}

class _SeriesTopRatedPageState extends State<SeriesTopRatedPage> {
  late SeriesListTopRatedCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SeriesListTopRatedCubit>();
    Future.microtask(() {
      _cubit.fetchTopRatedSeries();
      FirebaseAnalytics.instance.logScreenView(
        screenName: 'Series Top Rated',
        screenClass: 'SeriesTopRatedPage',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Series')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SeriesListTopRatedCubit, SeriesListTopRatedState>(
          builder: (context, data) {
            if (data.state == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.state == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = data.series[index];
                  return SeriesCard(series: series);
                },
                itemCount: data.series.length,
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
