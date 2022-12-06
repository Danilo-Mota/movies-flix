import '../../model/movies.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/movies_item/movie_item_view_model.dart';
import 'home_view_controller.dart';
import 'use_cases/get_popular_movies_use_case.dart';
import 'use_cases/get_top_rated_movies_use_case.dart';
import 'use_cases/get_upcoming_movies_use_case.dart';

class HomeViewModel extends HomeViewProtocol {

  List<Movies> _popularMovies = [];
  bool _popularMoviesIsLoading = true;
  bool _popularMoviesHasError = false;
  String _popularMoviesErrorMessage = '';

  List<Movies> _topRatedMovies = [];
  bool _topRatedMoviesIsLoading = true;
  bool _topRatedMoviesHasError = false;
  String _topRatedMoviesErrorMessage = '';

  List<Movies> _upcomingMovies = [];
  bool _upcomingMoviesIsLoading = true;
  bool _upcomingMoviesHasError = false;
  String _upcomingMoviesErrorMessage = '';

  final GetPopularMoviesUseCase popularMovieUseCase;
  final GetTopRatedMoviesUseCase topRatedMovieUseCase;
  final GetUpcomingMoviesUseCase upcomingMovieUseCase;

  HomeViewModel({
    required this.topRatedMovieUseCase,
    required this.popularMovieUseCase,
    required this.upcomingMovieUseCase,
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
  String get upcomingMoviesErrorMessage => _upcomingMoviesErrorMessage;
  
  @override
  bool get upcomingMoviesHasError => _upcomingMoviesHasError;
  
  @override
  bool get upcomingMoviesIsLoading => _upcomingMoviesIsLoading;

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
  List<MovieItemViewModelProtocol> get upcomingMovies {
    return _upcomingMovies.map((upcomingMovie) {
      return MovieItemViewModel(movie: upcomingMovie, showRating: false);
    }).toList();
  }

  @override
  void getPopularMovies() {
    _setPopularMoviesLoading(true);

    popularMovieUseCase.execute(
      success: (results) {
        _popularMovies = results.moviesResult;
        _setPopularMoviesLoading(false);
      },
      failure: (errorMessage) {
        _popularMoviesErrorMessage = errorMessage.description;
        _popularMoviesHasError = true;
        _setPopularMoviesLoading(false);
      },
    );
  }

  @override
  void getTopRatedMovies() {
    _setTopRatedMoviesLoading(true);

    topRatedMovieUseCase.execute(
      success: (results) {
        _topRatedMovies = results.moviesResult;
        _setTopRatedMoviesLoading(false);
      },
      failure: (errorMessage) {
        _topRatedMoviesErrorMessage = errorMessage.description;
        _topRatedMoviesHasError = true;
        _setTopRatedMoviesLoading(false);
      },
    );
  }

  @override
  void getUpcomingMovies() {
    _setUpcomingMoviesLoading(true);

    upcomingMovieUseCase.execute(
      success: (results) {
        _upcomingMovies = results.moviesResult;
        _setUpcomingMoviesLoading(false);
      },
      failure: (errorMessage) {
        _upcomingMoviesErrorMessage = errorMessage.description;
        _upcomingMoviesHasError = true;
        _setUpcomingMoviesLoading(false);
      },
    );
  }

  void _setPopularMoviesLoading(bool isLoading) {
    _popularMoviesIsLoading = isLoading;
    notifyListeners();
  }

  void _setTopRatedMoviesLoading(bool isLoading) {
    _topRatedMoviesIsLoading = isLoading;
    notifyListeners();
  }

  void _setUpcomingMoviesLoading(bool isLoading) {
    _upcomingMoviesIsLoading = isLoading;
    notifyListeners();
  }
}
