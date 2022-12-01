import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';
import '../use_cases/get_popular_movies_use_case.dart';
import '../use_cases/get_top_rated_movies_use_case.dart';
import '../use_cases/get_upcoming_movies_use_case.dart';

class HomeFactory {
  static const String route = '/home';

  static StatefulWidget home() {
    final router = MoviesRoutes();
    final popularMovieUseCase = GetPopularMoviesUseCase(routes: router);
    final topRatedMovieUseCase = GetTopRatedMoviesUseCase(routes: router);
    final upcomingMovieUseCase = GetUpcomingMoviesUseCase(routes: router);
    final viewModel = HomeViewModel(
      popularMovieUseCase: popularMovieUseCase,
      topRatedMovieUseCase: topRatedMovieUseCase,
      upcomingMovieUseCase: upcomingMovieUseCase,
    );

    return HomeViewController(viewModel: viewModel);
  }
}
