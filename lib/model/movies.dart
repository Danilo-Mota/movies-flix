class Movies {
  final int id;
  final String title;
  final double rating;
  final String posterPath;

  Movies.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        rating = map['rating'],
        posterPath = map['poster_path'];
}
