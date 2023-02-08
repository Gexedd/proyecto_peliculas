// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);
import 'dart:convert';
import 'package:proyecto_peliculas/models/models.dart';

class NowPlayingResponse {
  NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<movie> results;
  int totalPages;
  int totalResults;

  factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

  //El profe no lo usó String toJson() => json.encode(toMap());

  factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
    dates: Dates.fromMap(json["dates"]),
    page: json["page"],
    results: List<movie>.from(json["results"].map((x) => movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );


}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  ///String toJson() => json.encode(toMap());

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );
}


