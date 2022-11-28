class Movies {
  final int id;
  final String title;
  final String posterPath;

  Movies.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        posterPath = map['poster_path'];
}
