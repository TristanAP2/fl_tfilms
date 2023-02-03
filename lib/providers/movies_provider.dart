import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_tfilms/models/models.dart';

class MoviesProvider extends ChangeNotifier{
// https://api.themoviedb.org/3/movie/now_playing?api_key=cf482439358a9b6fbbd767f8bfae4a78&language=es-ES&page=1
  
  String _apiKey = 'cf482439358a9b6fbbd767f8bfae4a78';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List <Result> onDisplayMovies = [];


  MoviesProvider(){
    print('Movies provider inicializado');
    getOnDisplayMovies();
  }

//Metodo asincrono
  getOnDisplayMovies() async{
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', { 
        'api_key' : _apiKey,
         'language' : _language,
         'page' : '1',
      });
    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

    //Convertimos el json del html a un map
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    //Asignamos todos los resultados de las peliculas a la lista onDisplayMovies
    onDisplayMovies = nowPlayingResponse.results;

    //Redibujar el widget de las imagenes
    notifyListeners();

  }

}