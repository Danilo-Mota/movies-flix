import '../../model/movie_details.dart';
import 'details_view_controller.dart';
import 'use_cases/get_details_use_case.dart';

class DetailsViewModel extends DetailsViewProtocol {
  final int movieId;
  late MovieDetails details;
  final GetMovieDetailsUseCase detailsUseCase;

  bool _hasDetailsError = false;
  bool _isDetailsLoading = false;
  String _detailsErrorMessage = '';

  DetailsViewModel({required this.movieId, required this.detailsUseCase});

  @override
  String get overview => throw UnimplementedError();

  @override
  String get posterPath => throw UnimplementedError();

  @override
  String get title => throw UnimplementedError();

  @override
  void getMovieDetails() {
    showLoading(true);
    detailsUseCase.execute(
      movieId: movieId,
      success: (results) {
        details = results;
        showLoading(false);
      },
      failure: (errorMessage) {
        _hasDetailsError = true;
        showLoading(false);
      },
    );
  }

  void showLoading(bool isLoading) {
    _isDetailsLoading = isLoading;
    notifyListeners();
  }
}
