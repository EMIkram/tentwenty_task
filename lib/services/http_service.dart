import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tentwenty_task/modals/movie_genres.dart';

class HttpService{
static const String api_key = "a644bf1e55bbf9b18ed98b74468fb276";
static const String url = "https://api.themoviedb.org/3/movie/";


///upcoming movies list API
static Future<List<dynamic>?>  getUpcomingMoviesList() async {
  try{
      http.Response response = await http.get(Uri.parse(
          "${url}upcoming?api_key=$api_key"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['results'];
      }
      else {
        log(response.statusCode.toString());
        return null;
      }
    }
    catch(e) {
    return null;
  }
  }


/// movie details API
static Future<List<dynamic>?>  getMovieGenres(String movieID) async {
  try{
    http.Response response = await http.get(Uri.parse(
        "$url$movieID?api_key=$api_key"));
    if (response.statusCode == 200) {
     return  jsonDecode(response.body)['genres'];

    }
    else {
      log(response.statusCode.toString());
      return null;
    }
  }
  catch(e) {
    return null;
  }
}



/// movie videos API
static Future<List<dynamic>?>  getMovieVideos(String movieID) async {
  try{
    http.Response response = await http.get(Uri.parse(
        "$url$movieID/videos?api_key=$api_key"));
    if (response.statusCode == 200) {
      return  jsonDecode(response.body)['results'];
    }
    else {
      log(response.statusCode.toString());
      return null;
    }
  }
  catch(e) {
    return null;
  }
}


}