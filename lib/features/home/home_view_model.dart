import '../../model/movies.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/movies_item/movie_item_view_model.dart';
import 'home_view_controller.dart';
import 'use_cases/get_popular_movies_use_case.dart';
import 'use_cases/get_top_rated_movies_use_case.dart';

class HomeViewModel extends HomeViewProtocol {
  bool _popularMoviesIsLoading = true;
  bool _popularMoviesHasError = false;
  String _popularMoviesErrorMessage = '';
  bool _topRatedMoviesIsLoading = true;
  bool _topRatedMoviesHasError = false;
  String _topRatedMoviesErrorMessage = '';
  List<Movies> _popularMovies = [];
  List<Movies> _topRatedMovies = [];

  final GetPopularMoviesUseCase popularMovieUseCase;
  final GetTopRatedMoviesUseCase topRatedMovieUseCase;

  HomeViewModel({
    required this.topRatedMovieUseCase,
    required this.popularMovieUseCase,
  });

  @override
  String get popularMoviesErrorMessage => _popularMoviesErrorMessage;

  @override
  bool get popularMoviesHasError => _popularMoviesHasError;

  @override
  bool get popularMoviesIsLoading => _popularMoviesIsLoading;

  @override
  String get topRatedMoviesErrorMessage => _topRatedMoviesErrorMessage;

  @override
  bool get topRatedMoviesHasError => _topRatedMoviesHasError;

  @override
  bool get topRatedMoviesIsLoading => _topRatedMoviesIsLoading;

  @override
  List<MovieItemViewModelProtocol> get popularMovies {
    return _popularMovies.map((popularMovie) {
      return MovieItemViewModel(movie: popularMovie);
    }).toList();
  }

  @override
  List<MovieItemViewModelProtocol> get topRatedMovies {
    return _topRatedMovies.map((topRatedMovie) {
      return MovieItemViewModel(movie: topRatedMovie);
    }).toList();
  }

  @override
  void getPopularMovies() {
    _showLoading(true);

    popularMovieUseCase.execute(
      success: (results) {
        _popularMovies = results.moviesResult;
        _showLoading(false);
      },
      failure: (errorMessage) {
        _popularMoviesErrorMessage = errorMessage.description;
        _popularMoviesHasError = true;
        _showLoading(false);
      },
    );
  }

  @override
  void getTopRatedMovies() {}

  void _showLoading(bool isLoading) {
    _popularMoviesIsLoading = isLoading;
    notifyListeners();
  }
}
