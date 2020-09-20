
import 'package:films/src/models/actors_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:films/src/models/film_model.dart';

class FilmProvider {

    String _apikey    = 'c1f21dacad4f136260009b7167e81a99';
    String _url       = 'api.themoviedb.org';
    String _language  = 'en-US';

    Future<List<Film>> _processResponse(Uri url) async {
        final resp = await http.get(url);
        final decodeData = json.decode(resp.body);

        final films = new Films.fromJsonList(decodeData['results']);

        return films.items;
    }

    Future<List<Film>>getInMovies() async{

      final url = Uri.https(_url, '3/movie/now_playing', {

        'api_key'  : _apikey,
        'language' : _language

      });

      return await _processResponse(url);

    }

    Future<List<Actor>>getCast(String movieId) async{

      final url = Uri.https(_url, '3/movie/$movieId/credits', {

        'api_key'  : _apikey,
        'language' : _language

      });

      final resp = await http.get(url);
      final decodedData = json.decode( resp.body);

      final cast = new Cast.fromJsonList(decodedData['cast']);

      return cast.actors;

    }

    Future<List<Film>>searchFilm(String query) async{

      final url = Uri.https(_url, '3/search/movie', {

        'api_key'  : _apikey,
        'language' : _language,
        'query' : query,
        
      });

      return await _processResponse(url);

    }



}