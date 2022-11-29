import '../../../model/movies.dart';
import 'movie_item_view.dart';

class MovieItemViewHolder extends MovieItemViewHolderProtocol {
  final Movies movie;

  MovieItemViewHolder({required this.movie});

  @override
  String get posterPath => movie.posterPath;

  @override
  String get title => movie.title;
}
