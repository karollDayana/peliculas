import 'package:http/http.dart' as http;

import 'package:peliculas/src/models/pelicula_model.dart';
import 'dart:convert';

class PeliculasProvider {
  String _apikey    = '42c213d87d76dbc637b297a2c2f1fc8d';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  Future<List<Pelicula>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apikey,
      'language': _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    
    return peliculas.items;
  }
}