import '../../model/movie_details.dart';
import '../../support/utils/constants.dart';
import 'details_view_controller.dart';
import 'items/genres_item_view.dart';
import 'items/genres_view_model.dart';
import 'use_cases/get_details_use_case.dart';

class DetailsViewModel extends DetailsViewProtocol {
  final int movieId;
  MovieDetails? details;
  final GetMovieDetailsUseCase detailsUseCase;

  bool _hasDetailsError = false;
  bool _isDetailsLoading = false;
  String _detailsErrorMessage = '';

  DetailsViewModel({required this.movieId, required this.detailsUseCase});

  @override
  String get title => details?.title ?? '';

  @override
  String get rating => '${details?.rate.toStringAsFixed(1) ?? ''}${Constants.maxRatingPlaceholder}';

  @override
  String get overview => details?.overview ?? '';

  @override
  String get posterPath => '${Constants.imageBaseURL}${details?.posterPath}';

  @override
  bool get hasDetailsError => _hasDetailsError;

  @override
  bool get isDetailsLoading => _isDetailsLoading;

  @override
  String get detailsErrorMessage => _detailsErrorMessage;

  @override
  List<GenresViewModelProtocol> get genres {
    return details?.genders.map((genre) {
          return GenresViewModel(genre: genre);
        }).toList() ??
        [];
  }

  @override
  void getMovieDetails() {
    showLoading(isLoading: true);

    detailsUseCase.execute(
      movieId: movieId,
      success: (results) {
        details = results;
        showLoading(isLoading: false);
      },
      failure: (errorMessage) {
        _hasDetailsError = true;
        _detailsErrorMessage = errorMessage.description;
        showLoading(isLoading: false);
      },
    );
  }

  void showLoading({required bool isLoading}) {
    _isDetailsLoading = isLoading;
    notifyListeners();
  }
}
