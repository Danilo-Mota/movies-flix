import 'genre.dart';

class MovieDetails {
  final int id;
  final num rate;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final List<Genre> genders;

  MovieDetails.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        rate = map['vote_average'],
        overview = map['overview'],
        posterPath = map['poster_path'],
        releaseDate = map['release_date'],
        genders = List<Genre>.from(map['genres']?.map((map) => Genre.fromMap(map)));
}
