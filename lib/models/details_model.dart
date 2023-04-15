class DetailsMovieModels {
  final bool adult;
  String? backdropPath;
  final int budget;
  final int id;
  String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  String? overview;
  final double popularity;
  final String posterPath;

  final String releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  DetailsMovieModels(
      {required this.adult,
      this.backdropPath,
      required this.budget,
      required this.id,
      this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.revenue,
      required this.runtime,
      required this.status,
      this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory DetailsMovieModels.fromJson(Map<String, dynamic> json) {
    return DetailsMovieModels(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      budget: json['budget'],
      id: json['id'],
      imdbId: json['imdb_id']??'',
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview']??'',
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline']??'',
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
