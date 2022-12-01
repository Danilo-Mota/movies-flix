import 'movies.dart';

class MoviesResult {
  final List<Movies> moviesResult;

  MoviesResult.fromMap(Map<String, dynamic> map)
      : moviesResult = List<Movies>.from(map['results'].map((map) => Movies.fromMap(map)));
}
