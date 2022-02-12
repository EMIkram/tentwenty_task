import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyText extends StatelessWidget {
  String text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  double? letterSpacing;
  TextStyle? style;
  TextAlign? textAlign;
  TextDecoration? textDecoration;
   MyText(this.text,{
     this.fontSize,
     this.style,
     this.color,
     this.fontWeight,
     this.letterSpacing,
     this.textDecoration,
     this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: textAlign,
      style:  style??GoogleFonts.poppins(
        letterSpacing: letterSpacing,
        fontSize: fontSize??14.sp,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration
      ),

    );
  }
}
