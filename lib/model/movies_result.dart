import 'movies.dart';

class MoviesResult {
  final List<Movies> moviesResult;

  MoviesResult.fromMap(Map<String, dynamic> map) : moviesResult = map['results'];
}
