import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../model/movies.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/movies_item/movie_item_view_model.dart';
import '../../support/extensions/utils_extensions.dart';
import 'home_view_controller.dart';
import 'use_cases/get_popular_movies_use_case.dart';
import 'use_cases/get_top_rated_movies_use_case.dart';
import 'use_cases/get_upcoming_movies_use_case.dart';

class HomeViewModel extends HomeViewProtocol {
  bool _moviesHasError = false;
  bool _moviesIsLoading = false;
  String _moviesErrorMessage = '';
  List<Movies> _popularMovies = [];
  List<Movies> _topRatedMovies = [];
  List<Movies> _upcomingMovies = [];
  bool _popularMoviesIsLoading = false;
  bool _topRatedMoviesIsLoading = false;
  bool _upcomingMoviesIsLoading = false;

  final Localization l10n;
  final GetPopularMoviesUseCase popularMovieUseCase;
  final GetTopRatedMoviesUseCase topRatedMovieUseCase;
  final GetUpcomingMoviesUseCase upcomingMovieUseCase;

  HomeViewModel({
    required this.l10n,
    required this.topRatedMovieUseCase,
    required this.popularMovieUseCase,
    required this.upcomingMovieUseCase,
  });

  @override
  String get moviesErrorMessage => _moviesErrorMessage;

  @override
  bool get moviesHasError => _moviesHasError;

  @override
  bool get moviesIsLoading => _moviesIsLoading;

  @override
  List<MovieItemViewModelProtocol> get popularMovies {
    return _popularMovies.map((popularMovie) {
      return MovieItemViewModel(movie: popularMovie, l10n: l10n);
    }).toList();
  }

  @override
  List<MovieItemViewModelProtocol> get topRatedMovies {
    return _topRatedMovies.map((topRatedMovie) {
      return MovieItemViewModel(movie: topRatedMovie, l10n: l10n);
    }).toList();
  }

  @override
  List<MovieItemViewModelProtocol> get upcomingMovies {
    return _upcomingMovies.map((upcomingMovie) {
      return MovieItemViewModel(movie: upcomingMovie, l10n: l10n, showRating: false);
    }).toList();
  }

  @override
  void getPopularMovies() {
    _popularMoviesIsLoading = true;
    _handleState();

    popularMovieUseCase.execute(
      success: (results) {
        _popularMovies = results.moviesResult;
        _popularMoviesIsLoading = false;
        _handleState();
      },
      failure: (errorMessage) {
        _moviesHasError = true;
        _popularMoviesIsLoading = false;
        _handleState(errorMessage: errorMessage.description);
      },
    );
  }

  @override
  void getTopRatedMovies() {
    _topRatedMoviesIsLoading = true;
    _handleState();

    topRatedMovieUseCase.execute(
      success: (results) {
        _topRatedMovies = results.moviesResult;
        _topRatedMoviesIsLoading = false;
        _handleState();
      },
      failure: (errorMessage) {
        _moviesHasError = true;
        _topRatedMoviesIsLoading = false;
        _handleState(errorMessage: errorMessage.description);
      },
    );
  }

  @override
  void getUpcomingMovies() {
    _upcomingMoviesIsLoading = true;
    _handleState();

    upcomingMovieUseCase.execute(
      success: (results) {
        _upcomingMovies = results.moviesResult;
        _upcomingMoviesIsLoading = false;
        _handleState();
      },
      failure: (errorMessage) {
        _moviesHasError = true;
        _upcomingMoviesIsLoading = false;
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
    if (_popularMoviesIsLoading || _topRatedMoviesIsLoading || _upcomingMoviesIsLoading) {
      _moviesIsLoading = true;
    } else {
      _moviesIsLoading = false;
    }
  }

  void _checkIfHasError({String? errorMessage}) {
    if (_moviesHasError) {
      errorMessage.let((it) => {if (it.isNotEmpty) _moviesErrorMessage = it});
    }
  }
}
