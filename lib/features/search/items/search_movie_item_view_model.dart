import '../../../model/movies.dart';
import '../../../support/utils/constants.dart';
import 'search_movie_item_view.dart';

class SearchMovieItemViewModel extends SearchMovieItemViewModelProtocol {
  final Movies movie;

  SearchMovieItemViewModel({required this.movie});

  @override
  String get title => movie.title;

  @override
  String get posterPath => '${Constants.imageBaseURL}${movie.posterPath}';

}
