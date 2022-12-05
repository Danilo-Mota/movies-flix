import '../../../model/movies.dart';
import 'movie_item_view.dart';

class MovieItemViewModel extends MovieItemViewModelProtocol {
  final Movies movie;
  final bool showRating;

  MovieItemViewModel({required this.movie, this.showRating = true});

  @override
  String get posterPath => movie.posterPath;

  @override
  String get title => movie.title;

  @override
  num get rating => movie.rating;

  @override
  bool get ratingIsVisible => showRating;
}
