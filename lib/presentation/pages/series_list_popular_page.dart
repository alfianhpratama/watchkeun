import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchkeun/common/state_enum.dart';
import 'package:watchkeun/presentation/controller/series_list_popular_controller/series_list_popular_cubit.dart';
import 'package:watchkeun/presentation/widgets/series_card_list.dart';

class SeriesPopularPage extends StatefulWidget {
  static const routeName = '/popular-series';

  const SeriesPopularPage({super.key});

  @override
  State<SeriesPopularPage> createState() => _SeriesPopularPageState();
}

class _SeriesPopularPageState extends State<SeriesPopularPage> {
  late SeriesListPopularCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SeriesListPopularCubit>();
    Future.microtask(() {
      _cubit.fetchPopularSeries();
      FirebaseAnalytics.instance.logScreenView(
        screenName: 'Series Popular',
        screenClass: 'SeriesPopularPage',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Series')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SeriesListPopularCubit, SeriesListPopularState>(
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
