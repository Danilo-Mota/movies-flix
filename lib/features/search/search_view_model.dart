import '../../model/movies.dart';
import 'items/search_movie_item_view.dart';
import 'items/search_movie_item_view_model.dart';
import 'search_view_controller.dart';
import 'use_cases/get_search_movies.dart';

class SearchViewModel extends SearchViewProtocol {
  final GetSearchMoviesUseCase searchMoviesUseCase;

  List<Movies> _searchMovies = [];

  SearchViewModel({required this.searchMoviesUseCase});

  @override
  List<SearchMovieItemViewModelProtocol> get searchMovies {
    return _searchMovies.map((searchMovie) {
      return SearchMovieItemViewModel(movie: searchMovie);
    }).toList();
  }

  @override
  void getSearchedMovies(String text) {
    searchMoviesUseCase.execute(
      text: text,
      success: (results) {
        _searchMovies = results.moviesResult;
        notifyListeners();
      },
      failure: (errorMessage) {},
    );
  }
}
