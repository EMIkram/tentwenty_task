import 'package:get/get.dart';
import 'package:tentwenty_task/modals/upcoming_movie.dart';
import 'package:tentwenty_task/services/http_service.dart';

class HomeController extends GetxController {
  RxBool searchEnabled = false.obs;
  RxList<UpcomingMovie> upcomingMoviesList = <UpcomingMovie>[].obs;



 Future<void> getUpcomingMovies()async{
   List<dynamic>? jsonList = await  HttpService.getUpcomingMoviesList();
   if(jsonList!=null){
      upcomingMoviesList.value =
          jsonList.map((json) => UpcomingMovie.fromJson(json)).toList();
    }
  }

  @override
  void onReady() {
   getUpcomingMovies();
    super.onReady();
  }

}