class MovieModels {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String name;
  final String originalName;
  final String firstAirDate;
  final List<dynamic> originCountry;

  MovieModels(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.title,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      required this.name,
      required this.originalName,
      required this.firstAirDate,
      required this.originCountry});

  factory MovieModels.fromJson(Map<String, dynamic> json) {
    return MovieModels(
      adult: json['adult'] ?? true,
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      popularity: json['popularity'] ?? '',
      releaseDate: json['release_date'] ?? '',
      video: json['video'] ?? true,
      voteAverage: json['vote_average'] ?? 0,
      voteCount: json['vote_count'] ?? 0,
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      firstAirDate: json['first_air_date'] ?? '',
      originCountry: json['origin_country'] ?? [],
    );
  }
}
