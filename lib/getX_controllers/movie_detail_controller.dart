import 'package:get/get.dart';
import 'package:tentwenty_task/modals/movie_genres.dart';
import 'package:tentwenty_task/modals/movie_video.dart';
import 'package:tentwenty_task/modals/movie_modal.dart';
import 'package:tentwenty_task/services/http_service.dart';

class MovieDetailController extends GetxController{
  RxList<MovieGenres> movieGenres = <MovieGenres>[].obs;
  RxList<MovieVideo> movieVideos = <MovieVideo>[].obs;
  RxBool loading = false.obs;

  getGenres(String movieID)async{
    loading.value = true;
    List<dynamic>? rawList = await HttpService.getMovieGenres(movieID);
    if(rawList!=null)
    {
      print(rawList);
      rawList.forEach((json) {
        movieGenres.add(MovieGenres.fromJson(json));
      });
      loading.value = false;
    }
  }
  getVideos(String movieID)async{
    loading.value = true;
    List<dynamic>? rawList = await HttpService.getMovieVideos(movieID);
    if(rawList!=null)
    {
      print(rawList);
      rawList.forEach((json) {
        movieVideos.add(MovieVideo.fromJson(json));
      });
      loading.value = false;
    }
  }


}