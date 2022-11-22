import 'package:flutter/material.dart';

import '../features/bottom_navigation/bottom_navigation_view_controller.dart';
import '../features/bottom_navigation/di/bottom_navigation_factory.dart';

class MobileRouter {

  static String get initialRoute {
    return BottomNavigationViewController.route;
  }

  static final Map<String, WidgetBuilder> routes = {
    BottomNavigationViewController.route: (_) => BottomNavigationFactory.bottomNavigation(),
  };
}
