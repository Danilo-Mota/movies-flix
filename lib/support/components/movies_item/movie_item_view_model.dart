import '../../../model/movies.dart';
import '../../utils/constants.dart';
import 'movie_item_view.dart';

class MovieItemViewModel extends MovieItemViewModelProtocol {
  final Movies movie;
  final bool showRating;

  MovieItemViewModel({required this.movie, this.showRating = true});

  @override
  String get posterPath => '${Constants.imageBaseURL}${movie.posterPath}';

  @override
  String get title => movie.title;

  @override
  String get rating {
    return '${Constants.theMoviesDatabaseAbbreviation}${movie.rating.toString()}';
  }

  @override
  bool get ratingIsVisible => showRating;
}
