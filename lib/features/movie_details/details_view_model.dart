import '../../model/movie_details.dart';
import '../../model/movies.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/movies_item/movie_item_view_model.dart';
import '../../support/extensions/utils_extensions.dart';
import '../../support/utils/constants.dart';
import 'details_view_controller.dart';
import 'items/genres_item_view.dart';
import 'items/genres_view_model.dart';
import 'use_cases/get_details_use_case.dart';
import 'use_cases/get_similar_movies_use_case.dart';

class DetailsViewModel extends DetailsViewProtocol implements MovieItemViewModelDelegate {
  final int movieId;
  final GetMovieDetailsUseCase detailsUseCase;
  final GetSimilarMoviesUseCase similarMoviesUseCase;

  MovieDetails? _details;
  bool _hasError = false;
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isDetailsLoading = false;
  List<Movies> _similarMovies = [];
  bool _isSimilarMoviesLoading = false;

  DetailsViewModel({
    required this.movieId,
    required this.detailsUseCase,
    required this.similarMoviesUseCase,
  });

  @override
  String get title => _details?.title ?? '';

  @override
  String get rating => '${_details?.rate.toStringAsFixed(1) ?? ''}${Constants.maxRatingPlaceholder}';

  @override
  String get overview => _details?.overview ?? '';

  @override
  String get posterPath => '${Constants.imageBaseURL}${_details?.posterPath}';

  @override
  bool get hasError => _hasError;

  @override
  bool get isLoading => _isLoading;

  @override
  String get errorMessage => _errorMessage;

  @override
  List<GenresViewModelProtocol> get genres {
    return _details?.genders.map((genre) {
          return GenresViewModel(genre: genre);
        }).toList() ?? [];
  }

  @override
  List<MovieItemViewModelProtocol> get similarMovies {
    return _similarMovies.map((similarMovie) {
      return MovieItemViewModel(movie: similarMovie, delegate: this, showRating: false);
    }).toList();
  }

  @override
  void didTapMovie({required int movieId}) {
    onTapMovie?.call(movieId);
  }

  @override
  void didTapBack() {
    onTapBack?.call();
  }

  @override
  void getMovieDetails() {
    _isDetailsLoading = true;
    _handleState();

    detailsUseCase.execute(
      movieId: movieId,
      success: (results) {
        _details = results;
        _isDetailsLoading = false;
        _handleState();
      },
      failure: (errorMessage) {
        _hasError = true;
        _isDetailsLoading = false;
        _handleState(errorMessage: errorMessage.description);
      },
    );
  }

  @override
  void getSimilarMovies() {
    _isSimilarMoviesLoading = true;
    _handleState();

    similarMoviesUseCase.execute(
      movieId: movieId,
      success: (results) {
        _similarMovies = results.moviesResult;
        _isSimilarMoviesLoading = false;
        _handleState();
      },
      failure: (errorMessage) {
        _hasError = true;
        _isSimilarMoviesLoading = false;
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
    _isLoading = (_isDetailsLoading || _isSimilarMoviesLoading);
  }

  void _checkIfHasError({String? errorMessage}) {
    if (_hasError) {
      errorMessage.let((it) => {if (it.isNotEmpty) _errorMessage = it});
    }
  }
}
