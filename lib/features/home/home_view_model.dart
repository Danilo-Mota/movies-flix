import '../../model/movies.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/movies_item/movie_item_view_model.dart';
import '../../support/extensions/utils_extensions.dart';
import 'home_view_controller.dart';
import 'use_cases/get_popular_movies_use_case.dart';
import 'use_cases/get_top_rated_movies_use_case.dart';
import 'use_cases/get_upcoming_movies_use_case.dart';

class HomeViewModel extends HomeViewProtocol {
  bool _hasMoviesError = false;
  bool _isMoviesLoading = false;
  String _moviesErrorMessage = '';
  List<Movies> _popularMovies = [];
  List<Movies> _topRatedMovies = [];
  List<Movies> _upcomingMovies = [];
  bool _isPopularMoviesLoading = false;
  bool _isTopRatedMoviesLoading = false;
  bool _isUpcomingMoviesLoading = false;

  final GetPopularMoviesUseCase popularMovieUseCase;
  final GetTopRatedMoviesUseCase topRatedMovieUseCase;
  final GetUpcomingMoviesUseCase upcomingMovieUseCase;

  HomeViewModel({
    required this.topRatedMovieUseCase,
    required this.popularMovieUseCase,
    required this.upcomingMovieUseCase,
  });

  @override
  String get moviesErrorMessage => _moviesErrorMessage;

  @override
  bool get hasMoviesError => _hasMoviesError;

  @override
  bool get isMoviesLoading => _isMoviesLoading;

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
    _isPopularMoviesLoading = true;
    _handleState();

    popularMovieUseCase.execute(
      success: (results) {
        _popularMovies = results.moviesResult;
        _isPopularMoviesLoading = false;
        _handleState();
      },
      failure: (errorMessage) {
        _hasMoviesError = true;
        _isPopularMoviesLoading = false;
        _handleState(errorMessage: errorMessage.description);
      },
    );
  }

  @override
  void getTopRatedMovies() {
    _isTopRatedMoviesLoading = true;
    _handleState();

    topRatedMovieUseCase.execute(
      success: (results) {
        _topRatedMovies = results.moviesResult;
        _isTopRatedMoviesLoading = false;
        _handleState();
      },
      failure: (errorMessage) {
        _hasMoviesError = true;
        _isTopRatedMoviesLoading = false;
        _handleState(errorMessage: errorMessage.description);
      },
    );
  }

  @override
  void getUpcomingMovies() {
    _isUpcomingMoviesLoading = true;
    _handleState();

    upcomingMovieUseCase.execute(
      success: (results) {
        _upcomingMovies = results.moviesResult;
        _isUpcomingMoviesLoading = false;
        _handleState();
      },
      failure: (errorMessage) {
        _hasMoviesError = true;
        _isUpcomingMoviesLoading = false;
        _handleState(errorMessage: errorMessage.description);
      },
    );
  }

  void _handleState({String? errorMessage}) {
    _checkLoading();
    _checkIfHasError(errorMessage: errorMessage);
    notifyListeners();
  }

  void _checkLoading() {
    if (_isPopularMoviesLoading || _isTopRatedMoviesLoading || _isUpcomingMoviesLoading) {
      _isMoviesLoading = true;
    } else {
      _isMoviesLoading = false;
    }
  }

  void _checkIfHasError({String? errorMessage}) {
    if (_hasMoviesError) {
      errorMessage.let((it) => { if (it.isNotEmpty) _moviesErrorMessage = it });
    }
  }
}
