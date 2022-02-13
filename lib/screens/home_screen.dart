import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tentwenty_task/getX_controllers/home_controller.dart';
import 'package:tentwenty_task/modals/upcoming_movie.dart';
import 'package:tentwenty_task/screens/movie_detail_screen.dart';
import 'package:tentwenty_task/utils/color_palatte.dart';
import 'package:tentwenty_task/utils/constants.dart';
import 'package:tentwenty_task/widgets/my_icons.dart';
import 'package:tentwenty_task/widgets/my_text.dart';
import 'package:tentwenty_task/widgets/text_field.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
   TextEditingController searchController = TextEditingController();
   HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white_F6F6FA,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: ColorPalette.white_F6F6FA,
        title:Obx(
            ()=> controller.searchEnabled.value?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextField(
                width: double.maxFinite,
                leading: GestureDetector(
                    onTap: (){

                    },
                    child: SvgIcon(svgIcon: SvgIcons.search_icon,)),
                leadingHeight: 22,
                leadingWidth: 22,
                trailing: GestureDetector(
                  onTap: (){
                    controller.searchEnabled.value = false;
                  },
                  child: SvgIcon(svgIcon: SvgIcons.cross_icon,
                  height: 26,
                  width: 26,),
                ),
                trailingHeight: 28,
                trailingWidth: 28,
                hintText: "TV shows, movies and more",
                hintStyle: TextStyle(color: ColorPalette.grey_827D88.withOpacity(0.5)),
                controller: searchController,
              color: ColorPalette.light_grey_DBDBDF,),
            ):
          Row(
            children: [
              Text("Watch",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: (){
                    controller.searchEnabled.value = true;
                  },
                  child: SvgIcon(svgIcon: SvgIcons.search_icon))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(()=> upcomingMoviesList()),
          ),
          ///footer
          Container(
            height:70,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: ColorPalette.black_2E2739,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(svgIcon: SvgIcons.dashboard_icon),
                   const SizedBox(height: 8,),
                    MyText("Dashboard",color: ColorPalette.grey_827D88,
                    fontSize: 12,)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(svgIcon: SvgIcons.watch_icon,),
                    const SizedBox(height: 8,),
                    MyText("Watch",color: ColorPalette.white_F6F6FA,
                      fontSize: 12,)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(svgIcon: SvgIcons.media_library_icon),
                    const SizedBox(height: 8,),
                    MyText("Media Library",color: ColorPalette.grey_827D88,
                      fontSize: 12,)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(svgIcon: SvgIcons.more_icon,height: 30,),
                    const SizedBox(height: 8,),
                    MyText("More",color: ColorPalette.grey_827D88,
                      fontSize: 12,)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
 Widget upcomingMoviesList(){
return ListView.builder(
    itemCount: controller.upcomingMoviesList.length,
    itemBuilder: (context,index){
      UpcomingMovie movie = controller.upcomingMoviesList[index];
      return GestureDetector(
        onTap: (){
          Get.to(MovieDetailScreen(movie: movie));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                height: 250,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                color: ColorPalette.grey_827D88
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: movie.id.toString(),
                    child: Image.network(
                      imageURL+movie.posterPath.toString(),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),

              Container(
                height: 250,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  gradient:LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.9)
                    ]
                  )
                ),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MyText(movie.title??"",
                    color: ColorPalette.white_F6F6FA,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,

                  ),
                ),
              ),

            ],
          ),
        ),
      );
    });
  }

}
