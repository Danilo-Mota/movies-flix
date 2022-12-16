import 'package:flutter/material.dart';

import '../search_view_controller.dart';
import '../search_view_model.dart';

class SearchFactory {
  static const String route = '/search';

  static StatefulWidget search() {
    return SearchViewController(viewModel: SearchViewModel());
  }
}
