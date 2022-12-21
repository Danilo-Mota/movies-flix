import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../../../support/utils/localize.dart';
import '../search_view_controller.dart';
import '../search_view_model.dart';
import '../use_cases/get_search_movies.dart';

class SearchFactory {
  static const String route = '/search';

  static StatefulWidget search() {
    final routes = MoviesRoutes();
    final l10n = Localize.instance.l10n;
    final searchMovieUseCase = GetSearchMoviesUseCase(routes: routes);
    final viewModel = SearchViewModel(searchMoviesUseCase: searchMovieUseCase, l10n: l10n);

    return SearchViewController(viewModel: viewModel);
  }
}
