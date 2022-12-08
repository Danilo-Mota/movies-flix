class Movies {
  final int id;
  final num rating;
  final String title;
  final String posterPath;
  final String releaseDate;

  Movies.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        rating = map['vote_average'],
        posterPath = map['poster_path'],
        releaseDate = map['release_date'];
}
