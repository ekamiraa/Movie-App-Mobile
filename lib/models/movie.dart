class Movie {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;

  const Movie(
      {required this.id,
      required this.title,
      required this.voteAverage,
      required this.overview,
      required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      voteAverage: json['vote_average'] * 1.0 as double,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
    );
  }
}
