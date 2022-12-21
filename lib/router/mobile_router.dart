import 'package:flutter/material.dart';

import '../features/bottom_navigation/di/bottom_navigation_factory.dart';
import '../features/home/di/home_factory.dart';
import '../features/movie_details/di/details_factory.dart';
import '../features/search/di/search_factory.dart';

class MobileRouter {
  static String get initialRoute {
    return BottomNavigationFactory.route;
  }

  static final Map<String, WidgetBuilder> routes = {
    BottomNavigationFactory.route: (_) => BottomNavigationFactory.bottomNavigation(),
    HomeFactory.route: (_) => HomeFactory.home(),
    SearchFactory.route: (_) => SearchFactory.search(),
    MovieDetailsFactory.route: (context) {
      final movieId = ModalRoute.of(context)?.settings.arguments as int;
      return MovieDetailsFactory.details(movieId);
    }
  };
}
