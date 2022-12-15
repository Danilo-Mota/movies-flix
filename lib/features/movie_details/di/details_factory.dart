import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../details_view_controller.dart';
import '../details_view_model.dart';
import '../use_cases/get_details_use_case.dart';
import '../use_cases/get_similar_movies_use_case.dart';

class MovieDetailsFactory {
  static const String route = '/details';
  
  static StatefulWidget details(int movieId) {
    final routes = MoviesRoutes();
    final detailsUseCase = GetMovieDetailsUseCase(routes: routes);
    final similarMoviesUseCase = GetSimilarMoviesUseCase(routes: routes);
    final viewModel = DetailsViewModel(
      movieId: movieId,
      detailsUseCase: detailsUseCase,
      similarMoviesUseCase: similarMoviesUseCase,
    );

    return DetailsViewController(viewModel: viewModel);
  }
}
