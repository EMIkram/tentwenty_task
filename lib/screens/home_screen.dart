import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tentwenty_task/getX_controllers/home_controller.dart';
import 'package:tentwenty_task/modals/genre_modal.dart';
import 'package:tentwenty_task/modals/movie_modal.dart';
import 'package:tentwenty_task/screens/movie_detail_screen.dart';
import 'package:tentwenty_task/utils/color_palatte.dart';
import 'package:tentwenty_task/utils/constants.dart';
import 'package:tentwenty_task/widgets/my_back_button.dart';
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
      // appBar: AppBar(
      //
      //   elevation: 0,
      //   backgroundColor: ColorPalette.white_F6F6FA,
      //   title:Obx(
      //         ()=>controller.searchList.isNotEmpty
      //         ?Row(
      //       children: [
      //         MyBackButton(onTap: (){
      //           controller.searchList.clear();
      //           controller.searchedGenre = "";
      //         },
      //           color: ColorPalette.black_2E2739,),
      //         MyText("${controller.searchList.length} Results Found",
      //           fontSize: 17,
      //           fontWeight: FontWeight.w500,
      //           color: ColorPalette.black_2E2739,
      //         ),
      //       ],
      //     )
      //         : controller.searchFieldEnabled.value?
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: MyTextField(
      //         width: double.maxFinite,
      //         leading: GestureDetector(
      //             onTap: (){
      //
      //             },
      //             child: SvgIcon(svgIcon: SvgIcons.search_icon,)),
      //         leadingHeight: 22,
      //         leadingWidth: 22,
      //         trailing: GestureDetector(
      //           onTap: (){
      //             controller.searchFieldEnabled.value = false;
      //           },
      //           child: SvgIcon(svgIcon: SvgIcons.cross_icon,
      //             height: 26,
      //             width: 26,),
      //         ),
      //         trailingHeight: 28,
      //         trailingWidth: 28,
      //         hintText: "TV shows, movies and more",
      //         hintStyle: TextStyle(color: ColorPalette.grey_827D88.withOpacity(0.5)),
      //         controller: searchController,
      //         color: ColorPalette.light_grey_DBDBDF,),
      //     ):
      //     Row(
      //       children: [
      //         Text("Watch",
      //           style: GoogleFonts.poppins(
      //               color: Colors.black,
      //               fontWeight: FontWeight.bold
      //           ),
      //         ),
      //         const Spacer(),
      //         GestureDetector(
      //             onTap: (){
      //               controller.searchFieldEnabled.value = true;
      //             },
      //             child: SvgIcon(svgIcon: SvgIcons.search_icon))
      //       ],
      //     ),
      //   ),
      //
      // ),
      body: WillPopScope(
        onWillPop: (){
          controller.searchList.clear();
          controller.searchedGenre = "";
          controller.searchFieldEnabled.value=false;
         return  Future.value(false);
        },
        child: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 18),
                child: Obx(
                      ()=>controller.searchList.isNotEmpty
                      ?Row(
                    children: [
                      MyBackButton(onTap: (){
                        controller.searchList.clear();
                        controller.searchedGenre = "";
                      },
                        color: ColorPalette.black_2E2739,),
                      MyText("${controller.searchList.length} Result(s) Found",
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.black_2E2739,
                      ),
                    ],
                  )
                      : controller.searchFieldEnabled.value?
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
                          controller.searchFieldEnabled.value = false;
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
                      MyText("Watch",
                      fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: (){
                            controller.searchFieldEnabled.value = true;
                          },
                          child: SvgIcon(svgIcon: SvgIcons.search_icon))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Obx(()=>controller.searchList.isNotEmpty
                ?searchResultsUI()
    :controller.searchFieldEnabled.value
            ?searchByGenresUI()
                    :upcomingMoviesList()),
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
                        SvgIcon(svgIcon: SvgIcons.dashboard_icon,
                        height: 18,
                          width: 18,
                        ),
                       const SizedBox(height: 8,),
                        MyText("Dashboard",color: ColorPalette.grey_827D88,
                        fontSize: 12,)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(svgIcon: SvgIcons.watch_icon,
                          height: 18,
                          width: 18,),
                        const SizedBox(height: 8,),
                        MyText("Watch",color: ColorPalette.white_F6F6FA,
                          fontSize: 12,)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(svgIcon: SvgIcons.media_library_icon,
                          height: 18,
                          width: 18,),
                        const SizedBox(height: 8,),
                        MyText("Media Library",color: ColorPalette.grey_827D88,
                          fontSize: 12,)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(svgIcon: SvgIcons.more_icon,
                          height: 18,
                          width: 18,),
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
        ),
      ),
    );
  }
 Widget upcomingMoviesList(){
return ListView.builder(
    itemCount: controller.upcomingMoviesList.length,
    itemBuilder: (context,index){
      MovieModal movie = controller.upcomingMoviesList[index];
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
  
  Widget searchByGenresUI(){
    List<DummyGenres> dummyGenres = DummyGenres.getDummyGeres();
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: GridView.builder(
             gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                 childAspectRatio: 1.5,
                 crossAxisCount:  2 ),
             shrinkWrap: true,
             itemCount: dummyGenres.length,
             itemBuilder: (context,index){
               DummyGenres genre = dummyGenres[index];
               return GestureDetector(
                 onTap: ()  async {
                   controller.searchList.clear();
                   controller.searchedGenre = genre.name!;
                  await  controller.searchByGenreID(genre.id.toString());
                   controller.searchFieldEnabled.value = false;
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Stack(
                     children: [
                       Container(
                         height: 120,
                         width: double.maxFinite,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color: ColorPalette.grey_827D88
                         ),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(15),
                           child: Image.asset(
                             genre.imageUrl!,
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),

                       Container(
                         height: 120,
                         width: double.maxFinite,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color: Colors.black12
                         ),
                         alignment: Alignment.bottomLeft,
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: MyText(genre.name??"",
                             color: ColorPalette.white_F6F6FA,
                             fontSize: 18,
                             fontWeight: FontWeight.w500,

                           ),
                         ),
                       ),

                     ],
                   ),
                 ),
               );
             }),
       );
  }

  Widget searchResultsUI(){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          SizedBox(height:controller.searchFieldEnabled.value? 15:0,),
          Visibility(
            visible: controller.searchFieldEnabled.value,
            child: MyText("Top Results",
            color: ColorPalette.black_2E2739,
            fontSize: 16,),
          ),
           SizedBox(height:controller.searchFieldEnabled.value? 15:0,),
          Visibility(
              visible: controller.searchFieldEnabled.value,
              child: const Divider()),
         const SizedBox(height: 15,),
          ...controller.searchList.map((result) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   GestureDetector(
                     onTap: (){
                       Get.to(MovieDetailScreen(movie: result));
                     },
                     child: Container(
                       height: 120,
                       width: 180,
                       child: ClipRRect(
                         child: Hero(
                           tag: result.id!,
                           child: Image.network(imageURL+result.posterPath!,
                           fit: BoxFit.fitWidth,),
                         ),
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                   ),
                    const SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width:150,
                          child: MyText(result.title!,
                          color: ColorPalette.black_2E2739,
                            fontSize: 18,

                          ),
                        ),
                        MyText(controller.searchedGenre,
                        color: ColorPalette.grey_827D88,)
                      ],
                    ),
                    const Spacer(),
                    MyText("...",
                    fontSize: 35,
                      color: ColorPalette.blue_61C3F2,
                    ),
                    const SizedBox(width: 8,)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
