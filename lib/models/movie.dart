import 'dart:convert';

class movie {
  movie({
    required this.adult,
     this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
     this.posterPath,
     this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  get fullPosterImg{
    if (this.posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500${this.posterPath}';
    }
    return 'http://mireflex.sytes.net/cinemaplus2/build/img/Logocinemaplus.png';
  }

  factory movie.fromJson(String str) => movie.fromMap(json.decode(str));

  ///String toJson() => json.encode(toMap());

  factory movie.fromMap(Map<String, dynamic> json) => movie(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    releaseDate: (json["release_date"]),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );


}