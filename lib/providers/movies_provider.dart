import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_peliculas/models/models.dart';

//Creo la clase de MoviesProvider
class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '77039b776a56fd3b8ee03aeca22c0a23';
  String _language = 'es-ES';

  List<movie> onDisplayMovies = []; //LO inicializo como un arreglo vacío

//Ahora llamo al constructor.
//Es como programar un objeto
  MoviesProvider() {
    print("Movies Provider Inicializado");

    //Al llamar el constructor, ejecuto el ObtenerNowPlayingMovies
    this.ObtenerNowPlayinMovies();
  }

//Se crea el método para llamar a la parte HTTP
//Este deberá mostrar las peliculas en la parte superior del home
  ObtenerNowPlayinMovies() async {
    print("Obteniendo Now Playing Movies");

    var url = Uri.https(this._baseUrl, '3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
      'page': '1'});
    var response = await http.get(url);
    var nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

  print("Edd, esto lo estoy trayendo de la Apli:  " + nowPlayingResponse.results[0].title);
  this.onDisplayMovies = nowPlayingResponse.results;

  notifyListeners();

  }
}
