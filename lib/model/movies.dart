class Movies {
  final int id;
  final String title;
  final num rating;
  final String posterPath;

  Movies.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        rating = map['vote_average'],
        posterPath = map['poster_path'];
}
