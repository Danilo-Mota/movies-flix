import '../../../model/movies.dart';
import 'movie_item_view.dart';

class MovieItemViewModel extends MovieItemViewModelProtocol {
  final Movies movie;

  MovieItemViewModel({required this.movie});

  @override
  String get posterPath => movie.posterPath;

  @override
  String get title => movie.title;
  
  @override
  num get rating => movie.rating;
}
