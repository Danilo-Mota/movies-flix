import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';
import '../use_cases/get_popular_movies_use_case.dart';

class HomeFactory {
  static const String route = '/home';

  static StatefulWidget home() {
    final useCase = GetPopularMoviesUseCase(routes: MoviesRoutes());
    final viewModel = HomeViewModel(useCase: useCase);

    return HomeViewController(viewModel: viewModel);
  }
}
