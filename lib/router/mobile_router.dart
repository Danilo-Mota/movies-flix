import 'package:flutter/material.dart';

import '../features/bottom_navigation/di/bottom_navigation_factory.dart';

class MobileRouter {

  static String get initialRoute {
    return BottomNavigationFactory.route;
  }

  static final Map<String, WidgetBuilder> routes = {
    BottomNavigationFactory.route: (_) => BottomNavigationFactory.bottomNavigation(),
  };
}
