import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../details_view_controller.dart';
import '../details_view_model.dart';
import '../use_cases/get_details_use_case.dart';

class MovieDetailsFactory {
  static const String route = '/details';
  
  static StatefulWidget details(int movieId) {
    final routes = MoviesRoutes();
    final useCase = GetMovieDetailsUseCase(routes: routes);
    final viewModel = DetailsViewModel(
      detailsUseCase: useCase,
      movieId: movieId,
    );

    return DetailsViewController(viewModel: viewModel);
  }
}
