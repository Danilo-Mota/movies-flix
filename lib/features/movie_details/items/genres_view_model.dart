import '../../../model/genre.dart';
import 'genres_item_view.dart';

class GenresViewModel extends GenresViewModelProtocol {
  final Genre genre;

  GenresViewModel({required this.genre});

  @override
  String get genreName => genre.name;
}
