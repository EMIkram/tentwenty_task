import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_task/getX_controllers/movie_detail_controller.dart';
import 'package:tentwenty_task/modals/movie_video.dart';
import 'package:tentwenty_task/modals/upcoming_movie.dart';
import 'package:tentwenty_task/screens/youtube_player_screen.dart';
import 'package:tentwenty_task/utils/color_palatte.dart';
import 'package:tentwenty_task/utils/constants.dart';
import 'package:tentwenty_task/widgets/my_back_button.dart';
import 'package:tentwenty_task/widgets/my_button.dart';
import 'package:tentwenty_task/widgets/my_text.dart';

class MovieDetailScreen extends StatelessWidget {
  UpcomingMovie movie;
  MovieDetailController controller  = MovieDetailController();
  var getColor = {
    "0" : ColorPalette.blue_61C3F2,
    "1" : ColorPalette.pink_E26CA5,
    "2" : ColorPalette.purple_564CA3,
    "3" : ColorPalette.yellow_CD9D0F
  };
  int colorNumber = 0;
  MovieDetailScreen({required this.movie,Key? key}){
    controller.getGenres(movie.id.toString());
    controller.getVideos(movie.id.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*0.60,
                  width: double.maxFinite,
                  child: Hero(
                    tag: movie.id.toString(),
                    child: Image.network(imageURL+movie.posterPath.toString(),
                    fit: BoxFit.fitWidth,
                    ),
                  ),
             ),
              Container(
                height: MediaQuery.of(context).size.height*0.60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    gradient:LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.7),
                        ]
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyBackButton(),
                        MyText("Watch",
                        fontSize: 16,
                        color: ColorPalette.white_F6F6FA,
                        )
                      ],
                    ),
                    Spacer(),
                    MyText('In Theaters '+ DateFormat('MMMM dd,yyyy').format(DateTime.parse(movie.releaseDate.toString())),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.white_F6F6FA,
                    ),
                    const SizedBox(height: 24,),
                    MyButton(width: 280,
                        height: 60,
                        color: ColorPalette.blue_61C3F2,
                        child: Center(
                          child: MyText("Get Tickets",
                          color: ColorPalette.white_F6F6FA,
                          fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: (){
                      }),
                   const SizedBox(height: 12,),
                    MyButton(width: 280,
                        height: 60,
                        outlined: true,
                        color: ColorPalette.blue_61C3F2,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_arrow,
                                color: ColorPalette.white_F6F6FA,),
                              MyText(" Watch Trailer",
                                color: ColorPalette.white_F6F6FA,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        onPressed: (){
                          int index = controller.movieVideos.indexWhere((element) => element.type!.toUpperCase()=="Trailer".toUpperCase());
                          print(index);
                          Get.to(()=>YoutubePlayerScreen(controller.movieVideos[index].key!));

                        }),
                    const SizedBox(height: 35,),
                  ],
                ),
              )

            ],
          ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.40-70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.maxFinite,),
                MyText("Genres",
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: ColorPalette.textColor,
                ),
               const SizedBox(height: 20,),
                Obx(
                    ()=> SizedBox(
                      height: 35,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                          children: controller.movieGenres.map((genre)
                              {
                                Color? color = getColor[(colorNumber%4).toString()];
                                colorNumber++;
                                return   Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: color
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                                      child: MyText(genre.name!,
                                        color: ColorPalette.white_F6F6FA,),
                                    ),
                                  ),
                                );
                              }
                            ).toList(),
                        ),
                    )
                ),
                const SizedBox(height: 20,),
                MyText("Overview",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.textColor,
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: SizedBox(
                      child: SingleChildScrollView(
                          child: MyText(movie.overview!,
                          color: ColorPalette.grey_827D88,))),
                )
              ],
            ),
          ),
        ),
        ],
      )
    );
  }
}
