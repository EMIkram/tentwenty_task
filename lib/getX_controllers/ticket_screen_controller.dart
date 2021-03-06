import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty_task/utils/color_palatte.dart';

class TicketScreenController extends GetxController{

   RxList<List<int>> seatings = [
    [0,0,0,2,1,0,1,1,1,1,1,1,1,2,3,3,0,1,1,0,0,0],
    [0,1,1,1,1,0,1,2,1,2,1,2,1,2,1,1,0,1,2,1,1,0],
    [0,1,1,1,1,0,1,2,1,2,1,2,1,2,1,1,0,1,2,1,1,0],
    [0,1,1,1,1,0,1,2,1,2,1,2,1,2,1,1,0,1,2,1,1,0],
    [0,1,1,1,1,0,1,2,1,2,1,2,1,2,1,1,0,1,2,1,1,0],
    [2,1,1,1,1,0,1,2,1,2,1,2,1,2,1,1,0,1,2,1,1,1],
    [2,1,1,1,1,0,1,2,1,2,1,2,1,2,1,1,0,1,2,1,1,1],
    [2,1,1,1,1,0,1,2,1,2,1,2,1,2,1,1,0,1,2,1,1,1],
    [2,1,1,1,1,0,1,2,1,2,1,2,1,2,1,1,0,1,2,1,1,1],
    [3,3,3,3,3,0,1,4,4,4,4,4,4,4,1,1,0,1,3,3,3,1],
  ].obs;

   List dates = ['5 mar','6 Mar','7 Mar','8 Mar','9 Mar'];

   RxInt selectedDateIndex = 0.obs;
   var seatColor = [Colors.transparent,ColorPalette.grey_827D88,ColorPalette.yellow_CD9D0F,ColorPalette.blue_61C3F2,ColorPalette.purple_564CA3];

}