import '../../../model/movies.dart';
import 'home_item_view.dart';

class HomeItemViewModel extends HomeItemViewModelProtocol {
  final Movies movie;

  HomeItemViewModel({required this.movie});

  @override
  String get posterPath => movie.posterPath;

  @override
  String get title => movie.title;
}
