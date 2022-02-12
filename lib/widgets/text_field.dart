import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty_task/utils/color_palatte.dart';
class MyTextField extends StatefulWidget {
  Widget? leading;
  double? leadingWidth;
  double? leadingHeight;
  Widget? trailing;
  double? trailingWidth;
  double? trailingHeight;
  String? hintText;
  bool isPassword;
  bool validation;
  Color? color;
  double? height;
  double? width;
  TextStyle? hintStyle;
  TextEditingController controller;

   MyTextField(
       {this.hintText,
         required this.controller,
         this.leading,
         this.trailing,
         this.isPassword=false,
         this.validation=true,
         this.height,
         this.width,
         this.color,
         this.leadingHeight,
         this.leadingWidth,
         this.trailingHeight,
         this.trailingWidth,
         this.hintStyle,

         Key? key}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: widget.height??60.h,
      width: widget.width??290.w,
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 15.h,bottom: 15.h,left: 15.h),
            child: Container(
              height: widget.leadingHeight?? 24.h,
              width: widget.leadingWidth??24.h,
              child: widget.leading??  SizedBox(
                height: 24.h,
                width: 24.h,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(left: 13.w),
              child: TextField(
                controller: widget.controller,
                obscureText: widget.isPassword?obsecureText:false,
                style:  TextStyle(fontSize: 12, color: widget.validation?ColorPalette.black_2E2739:Colors.red),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: widget.hintText??"",
                  hintStyle: widget.hintStyle??TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: ColorPalette.white_F6F6FA),
                ),
              ),
            ),
          ),
          Padding(
            padding: widget.isPassword? EdgeInsets.only(top: 15.h,bottom: 15.h,right: 15.h)
                : EdgeInsets.only(top: 0,bottom: 0,right: 15.h),
            child: widget.isPassword?
            Container(
              height: 24.h,
              width: 24.h,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                },
                child: Icon(obsecureText?
                Icons.visibility_off:
                Icons.visibility,
                color: ColorPalette.grey_827D88,),
              ),
            ):
            widget.trailing!=null?
                Container(
                  height: widget.trailingHeight?? 24.h,
                  width: widget.trailingWidth??24.h,
                  child: widget.trailing
                )
                : SizedBox(
              height: 24.h,
              width: 24.h,
            ),
          ),
        ],
      ),decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: widget.color??ColorPalette.white_F6F6FA
    ),
    );
  }
}
