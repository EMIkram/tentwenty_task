import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty_task/utils/color_palatte.dart';

class MyButton extends StatelessWidget {
  String label;
  Widget? child;
  GestureTapCallback onPressed;
  double height;
  double width;
  double? fontSize;
  Color color;
  bool enabled;

  MyButton(
      { this.label="",
        this.child,
        required this.width,
        this.fontSize,
        this.enabled=true,
        required this.height,
        required this.color,
        required this.onPressed,
        Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled?onPressed:null,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: enabled?color:ColorPalette.grey_827D88,
          borderRadius: BorderRadius.circular(28.r)
        ),
        child:child?? Center(child: Text(
          label,
          style: TextStyle(
          color: ColorPalette.white_F6F6FA,
          fontWeight: FontWeight.bold,
          fontSize: fontSize??14.sp
        ),
        ),
        ),
      ),
    );
  }
}
