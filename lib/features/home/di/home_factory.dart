import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../../../support/utils/localize.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';
import '../use_cases/get_popular_movies_use_case.dart';
import '../use_cases/get_top_rated_movies_use_case.dart';
import '../use_cases/get_upcoming_movies_use_case.dart';

class HomeFactory {
  static const String route = '/home';

  static StatefulWidget home() {
    final routes = MoviesRoutes();
    final l10n = Localize.instance.l10n;
    final popularMovieUseCase = GetPopularMoviesUseCase(routes: routes);
    final topRatedMovieUseCase = GetTopRatedMoviesUseCase(routes: routes);
    final upcomingMovieUseCase = GetUpcomingMoviesUseCase(routes: routes);
    final viewModel = HomeViewModel(
      l10n: l10n,
      popularMovieUseCase: popularMovieUseCase,
      topRatedMovieUseCase: topRatedMovieUseCase,
      upcomingMovieUseCase: upcomingMovieUseCase,
    );

    return HomeViewController(viewModel: viewModel);
  }
}
