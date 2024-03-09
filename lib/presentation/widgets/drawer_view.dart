import 'package:flutter/material.dart';
import 'package:watchkeun/presentation/pages/about_page.dart';
import 'package:watchkeun/presentation/pages/home_movie_page.dart';
import 'package:watchkeun/presentation/pages/series_page.dart';
import 'package:watchkeun/presentation/pages/watchlist_movies_page.dart';
import 'package:watchkeun/presentation/pages/watchlist_series_page.dart';

class DrawerView extends StatelessWidget {
  final VoidCallback onRefresh;
  final bool isMovie;

  const DrawerView({super.key, required this.onRefresh, required this.isMovie});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              if (isMovie) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeMoviePage.routeName, (_) => false);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('TV Series'),
            onTap: () {
              if (!isMovie) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, SeriesPage.routeName, (_) => false);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist - Moview'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistMoviesPage.routeName)
                  .then((_) => onRefresh);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist - Series'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistSeriesPage.routeName)
                  .then((_) => onRefresh);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutPage.routeName)
                  .then((_) => onRefresh);
            },
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
          ),
        ],
      ),
    );
  }
}
