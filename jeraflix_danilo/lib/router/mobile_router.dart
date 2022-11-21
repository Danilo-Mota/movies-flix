import 'package:flutter/material.dart';

import '../features/di/home_factory.dart';
import '../features/home_view_controller.dart';

class MobileRouter {

  static String get initialRoute {
    return HomeViewController.route;
  }

  static final Map<String, WidgetBuilder> routes = {
    HomeViewController.route: (_) => HomeFactory.home(),
  };
}
