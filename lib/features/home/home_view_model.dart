import '../../model/movies.dart';
import 'home_view_controller.dart';
import 'items/home_item_view.dart';
import 'items/home_item_view_model.dart';
import 'use_cases/get_popular_movies_use_case.dart';

class HomeViewModel extends HomeViewControllerProtocol {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  List<Movies> _movies = [];
  final GetPopularMoviesUseCase useCase;

  HomeViewModel({required this.useCase});

  @override
  List<HomeItemViewModelProtocol> get popularMovies {
    return _movies.map((popularMovie) {
      return HomeItemViewModel(movie: popularMovie);
    }).toList();
  }

  @override
  void getPopularMovies() {
    _showLoading(true);

    useCase.execute(
        success: (results) {
          _movies = results.moviesResult;
          _showLoading(false);
        },
        error: (error) => _handleGetPopularMoviesError(error));
  }

  @override
  String get errorMessage => _errorMessage;

  @override
  bool get hasError => _hasError;

  @override
  bool get isLoading => _isLoading;

  void _handleGetPopularMoviesError(String errorMessage) {
    _errorMessage = errorMessage;
    _hasError = true;
    _showLoading(false);
  }

  void _showLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
