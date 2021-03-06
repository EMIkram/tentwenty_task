import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tentwenty_task/modals/movie_genres.dart';

class HttpService{
static const String api_key = "a644bf1e55bbf9b18ed98b74468fb276";
static const String url = "https://api.themoviedb.org/3";


///upcoming movies list API
static Future<List<dynamic>?>  getUpcomingMoviesList() async {
  try{
      http.Response response = await http.get(Uri.parse(
          "$url/movie/upcoming?api_key=$api_key"
      ));
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
        "$url/movie/$movieID?api_key=$api_key"));
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
        "$url/movie/$movieID/videos?api_key=$api_key"));
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


/// search by genre id
static Future<List<dynamic>?>  searchbyGenreID(String genreID) async {
  try{
    http.Response response = await http.get(Uri.parse(
        "$url/discover/movie?with_genres=878&api_key=$api_key"));
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