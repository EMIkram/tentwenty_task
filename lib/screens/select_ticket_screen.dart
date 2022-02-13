import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty_task/getX_controllers/ticket_screen_controller.dart';
import 'package:tentwenty_task/modals/movie_modal.dart';
import 'package:tentwenty_task/utils/color_palatte.dart';
import 'package:tentwenty_task/widgets/my_back_button.dart';
import 'package:tentwenty_task/widgets/my_button.dart';
import 'package:tentwenty_task/widgets/my_icons.dart';
import 'package:tentwenty_task/widgets/my_text.dart';

class SelectTicketScreen extends StatelessWidget {
  MovieModal movie ;
   SelectTicketScreen(this.movie,{Key? key}) : super(key: key);
TicketScreenController controller = TicketScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            SizedBox(height:20 ,
            width: double.maxFinite,),

           Container(
             color: ColorPalette.white_F6F6FA,
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 MyBackButton(color: Colors.black,),
                 Spacer(),
                 Column(
                   children: [
                     MyText(movie.title!,
                       fontSize: 24,
                       fontWeight: FontWeight.w500,
                       color: ColorPalette.black_2E2739,
                     ),
                     MyText('In Theaters '+ DateFormat('MMMM dd,yyyy').format(DateTime.parse(movie.releaseDate.toString())),
                       fontSize: 20,
                       fontWeight: FontWeight.w500,
                       color: ColorPalette.blue_61C3F2,
                     ),
                   ],
                 ),
                 Spacer(),
                 SizedBox(width: 25,)
               ],
             ),
           ),
            Expanded(child: Container(
              width: double.maxFinite,
              color: ColorPalette.light_grey_DBDBDF,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText("Date",
                    fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      height: 35,
                      child: Obx(
                        ()=> ListView(
                          scrollDirection: Axis.horizontal,
                          children: controller.dates.map((date) => Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: controller.dates[controller.selectedDateIndex.value]==date
                                ?ColorPalette.blue_61C3F2
                                    :ColorPalette.grey_827D88.withOpacity(0.1)
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  controller.selectedDateIndex.value = controller.dates.indexOf(date);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                                  child: MyText(date,
                                  color:controller.dates[controller.selectedDateIndex.value]==date
                                      ? ColorPalette.white_F6F6FA
                                    :ColorPalette.black_2E2739,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )).toList(),
                        ),

                      ),
                    ),

                    Spacer(),

                    Container(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                         ...[1,2].map((e) =>Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 children: [
                                   MyText("12:30 ",
                                     fontSize: 16,
                                   ),

                                   MyText(" Cinetech + hall 1",
                                     color: ColorPalette.grey_827D88,
                                     fontSize: 16,
                                   )
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   cenimaSeatingView(),
                                 ],
                               ),

                               Row(
                                 children: [
                                   MyText("From ",
                                     color: ColorPalette.grey_827D88,
                                     fontSize: 16,
                                   ),
                                   MyText("50\$ ",
                                     fontSize: 16,
                                     fontWeight: FontWeight.w500,
                                   ),

                                   MyText("or ",
                                     color: ColorPalette.grey_827D88,
                                     fontSize: 16,
                                   ),
                                   MyText("2500 Bonus",
                                     fontWeight: FontWeight.w500,
                                     fontSize: 16,
                                   ),
                                 ],
                               ),

                             ],
                           ),
                         ) ).toList()

                        ],
                      ),

                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyButton(
                        child: Center(
                          child: MyText("Select Seats",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.white_F6F6FA,
                          ),
                        ),
                          width: double.maxFinite,
                          height: 60,
                          color: ColorPalette.blue_61C3F2,
                          onPressed: (){

                      }),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget cenimaSeatingView(){

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.blue_61C3F2),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/screen.png",
            width: 280,
            height: 30,
            ),
           ...controller.seatings.map((row) => Row(
             children: row.map((seat) =>
                 Padding(
                   padding: const EdgeInsets.all(1.0),
                   child: SvgIcon(svgIcon: SvgIcons.seat_icon,
                   height: 10,
                   width: 10,
                   color: controller.seatColor[seat],
                   ),
                 )
             ).toList(),
           )).toList()
          ],
        ),
      ),
    );

  }
}
