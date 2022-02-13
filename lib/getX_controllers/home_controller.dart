import 'package:get/get.dart';
import 'package:tentwenty_task/modals/movie_modal.dart';
import 'package:tentwenty_task/services/http_service.dart';

class HomeController extends GetxController {
  RxBool searchFieldEnabled = false.obs;
  RxList<MovieModal> upcomingMoviesList = <MovieModal>[].obs;
  RxList<MovieModal> searchList = <MovieModal>[].obs;
  String searchedGenre = "Fantasy";


 Future<void> getUpcomingMovies()async{
   List<dynamic>? jsonList = await  HttpService.getUpcomingMoviesList();
   if(jsonList!=null){
      upcomingMoviesList.value =
          jsonList.map((json) => MovieModal.fromJson(json)).toList();
    }
  }
  Future<void> searchByGenreID(String genreID)async{
    List<dynamic>? jsonList = await  HttpService.searchbyGenreID(genreID);
    if(jsonList!=null){
      searchList.value =
          jsonList.map((json) => MovieModal.fromJson(json)).toList();
    }
  }



  @override
  void onReady() {
   getUpcomingMovies();
    super.onReady();
  }

}