import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBackButton extends StatelessWidget {
  EdgeInsets? padding;
   MyBackButton({this.padding,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child:   Padding(
        padding: padding?? EdgeInsets.symmetric(horizontal: 13.w,vertical: 18.h),
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
