import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_peliculas/models/models.dart';

//Creo la clase de MoviesProvider
class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '77039b776a56fd3b8ee03aeca22c0a23';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = []; //LO inicializo como un arreglo vacío
  List<Movie> popularMovies =[];

//Ahora llamo al constructor.
//Es como programar un objeto
  MoviesProvider() {
    print("Movies Provider Inicializado");

    //Al llamar el constructor, ejecuto el ObtenerNowPlayingMovies
    this.ObtenerNowPlayinMovies();
    this.getPopularMovies();
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

  print("Edd, esto lo estoy trayendo de la Appi:  " + nowPlayingResponse.results[0].title);
  this.onDisplayMovies = nowPlayingResponse.results;

  notifyListeners();
  }

  getPopularMovies () async  {

    print("Obteniendo Peliculas Populares");

    var url = Uri.https(this._baseUrl, '3/movie/popular',{ //Aqui cambio la ruta del json a popular. Ver el link
      'api_key': _apiKey,
      'language': _language,
      'page': '1'});
    var response = await http.get(url);
    var popularResponse = PopularResponse.fromJson(response.body);

    this.popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);

    notifyListeners();

}
}
