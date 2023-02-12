import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_peliculas/helpers/debouncer.dart';
import 'package:proyecto_peliculas/models/models.dart';
import 'package:proyecto_peliculas/models/search_response.dart';

//Creo la clase de MoviesProvider
class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '77039b776a56fd3b8ee03aeca22c0a23';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = []; //LO inicializo como un arreglo vacío
  List<Movie> popularMovies =[];

  Map<int, List<Cast>>moviesCast = {};

  int _popularPage = 0; //Se declara la variable que será la pagina de las peliculas populares. De tipo privada

  final debouncer = Debouncer(duration: Duration(milliseconds: 500),);

final StreamController<List <Movie>> _suggestionStreamController = new StreamController.broadcast();
Stream <List<Movie>> get suggestionStream =>this._suggestionStreamController.stream;


//Ahora llamo al constructor.
//Es como programar un objeto
  MoviesProvider() {
    print("Movies Provider Inicializado");

    //Al llamar el constructor, ejecuto el ObtenerNowPlayingMovies
    this.ObtenerNowPlayinMovies();
    this.getPopularMovies();


  }

  //Optimizando el código
Future <String> _getJsonData(String endpoint, [int page=1]) async {

  var url = Uri.https(this._baseUrl, endpoint,{
    'api_key': _apiKey,
    'language': _language,
    'page': '$page'});
  var response = await http.get(url);
  return response.body;
  var nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
}


//Se crea el método para llamar a la parte HTTP
//Este deberá mostrar las peliculas en la parte superior del home
  ObtenerNowPlayinMovies() async {
    print("Obteniendo Now Playing Movies");

    final jsonData = await this._getJsonData('3/movie/now_playing');
    var nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

  print("Edd, esto lo estoy trayendo de la Appi:  " + nowPlayingResponse.results[0].title);
  this.onDisplayMovies = nowPlayingResponse.results;

  notifyListeners();
  }

  getPopularMovies () async  {
    print("Obteniendo Peliculas Populares");

    _popularPage++;
    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    var popularResponse = PopularResponse.fromJson(jsonData);

    this.popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);

    notifyListeners();
}

Future <List<Cast>> getMovieCast(int movieId) async {
    //TODO revisar el mapa

  if (moviesCast.containsKey(movieId)) return moviesCast [movieId]!;

  print('pidiendo info de los actores al servidor');
  final jsonData = await this._getJsonData('3/movie/$movieId/credits');
  final creditsResponse = CreditsResponse.fromJson(jsonData);

  moviesCast[movieId] = creditsResponse.cast;
  return creditsResponse.cast;

}

Future <List<Movie>> searchMovies (String query) async {

  var url = Uri.https(this._baseUrl, '3/search/movie', {
    'api_key': _apiKey,
    'language': _language,
    'query': query,
  });

  var response = await http.get(url);
  final searchResponse = SearchResponse.fromJson (response.body);

  return searchResponse.results;
}

void getSuggestionsByQuery (String searchTerm){

    debouncer.value ='';
    debouncer.onValue=(value) async {

      final results = await this.searchMovies(value);
      this._suggestionStreamController.add(results);
      print('tenemos valor a buscar: $value');

    };

    final timer = Timer .periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel() );
}

}
