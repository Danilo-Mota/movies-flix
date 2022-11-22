import 'package:flutter/material.dart';

import '../bottom_navigation_view_controller.dart';
import '../bottom_navigation_view_model.dart';

class BottomNavigationFactory {
  static const String route = '/home';

  static StatefulWidget bottomNavigation() {
    final viewModel = BottomNavigationViewModel();

    return BottomNavigationViewController(viewModel: viewModel);
  }
}
