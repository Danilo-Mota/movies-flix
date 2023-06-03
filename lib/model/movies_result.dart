import 'movies.dart';

class MoviesResult {
  final List<Movies> moviesResult;

  MoviesResult.fromMap(Map<String, dynamic> map)
      : moviesResult = List<Movies>.from(map['data'].map((map) => Movies.fromMap(map)));
}
