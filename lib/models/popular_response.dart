

import 'package:proyecto_peliculas/models/models.dart';
import 'dart:convert';

class PopularResponse {
  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<movie> results;
  int totalPages;
  int totalResults;

  factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
    page: json["page"],
    results: List<movie>.from(json["results"].map((x) => movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );


}


