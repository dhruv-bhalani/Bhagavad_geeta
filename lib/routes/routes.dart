import 'package:bhagavat_geeta/screen/Introduction/view/Introduction.dart';

import 'package:bhagavat_geeta/screen/chaptersscreen/view/chapters.dart';
import 'package:bhagavat_geeta/screen/homescreen/view/home.dart';
import 'package:bhagavat_geeta/screen/splashscreen/view/splash.dart';
import 'package:bhagavat_geeta/screen/verses/view/verses.dart';
import 'package:flutter/material.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> get allRoutes {
    return {
      '/': (context) => const Splash(),
      '/home': (context) => const Home(),
      '/intro': (context) => const Introduction(),
      '/chapters': (context) => const Chapters(),
      '/verse': (context) => const Verses(),
    };
  }
}
