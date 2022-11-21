import 'package:flutter/material.dart';

import '../home_view_controller.dart';
import '../home_view_model.dart';

class HomeFactory {
  static StatefulWidget home() {
    final viewModel = HomeViewModel();

    return HomeViewController(viewModel: viewModel);
  }
}
