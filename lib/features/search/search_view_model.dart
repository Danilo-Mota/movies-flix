import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../model/movies.dart';
import 'items/search_movie_item_view.dart';
import 'items/search_movie_item_view_model.dart';
import 'search_view_controller.dart';
import 'use_cases/get_search_movies.dart';

class SearchViewModel extends SearchViewProtocol {
  final Localization l10n;
  final GetSearchMoviesUseCaseProtocol searchMoviesUseCase;

  String? _errorMessage;
  bool _isLoading = false;
  List<Movies>? _searchMovies;

  SearchViewModel({required this.searchMoviesUseCase, required this.l10n});

  @override
  bool get isLoading => _isLoading;

  @override
  String? get errorMessage => _errorMessage;

  @override
  List<SearchMovieItemViewModelProtocol> get searchMovies {
    return _searchMovies?.map((searchMovie) {
          return SearchMovieItemViewModel(movie: searchMovie, l10n: l10n);
        }).toList() ?? [];
  }

  @override
  void getSearchedMovies(String text) {
    _errorMessage = null;
    _showLoading(true);

    searchMoviesUseCase.execute(
      text: text,
      success: (results) {
        _searchMovies = results.moviesResult;
        _showLoading(false);
      },
      failure: (error) {
        _errorMessage = error.description;
        _showLoading(false);
      },
    );
  }

  void _showLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
