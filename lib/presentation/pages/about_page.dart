import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:watchkeun/common/constants.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about';

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logScreenView(
      screenName: 'About',
      screenClass: 'AboutPagePage',
    );
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: kPrussianBlue,
                  child: Center(
                    child: Image.asset('assets/circle-g.png', width: 128),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  color: kMikadoYellow,
                  child: const Text(
                    'Ditonton merupakan sebuah aplikasi katalog film yang '
                    'dikembangkan oleh Dicoding Indonesia sebagai contoh '
                    'proyek aplikasi untuk kelas Menjadi Flutter Developer Expert.\n\n\n\n'
                    'Edited by Alfian Hadi Pratama',
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          )
        ],
      ),
    );
  }
}
