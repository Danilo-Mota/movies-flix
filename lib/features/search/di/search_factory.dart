import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../search_view_controller.dart';
import '../search_view_model.dart';
import '../use_cases/get_search_movies.dart';

class SearchFactory {
  static const String route = '/search';

  static StatefulWidget search() {
    final routes = MoviesRoutes();
    final searchMovieUseCase = GetSearchMoviesUseCase(routes: routes);
    final viewModel = SearchViewModel(searchMoviesUseCase: searchMovieUseCase);

    return SearchViewController(viewModel: viewModel);
  }
}
