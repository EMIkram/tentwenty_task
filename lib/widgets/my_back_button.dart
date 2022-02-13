import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  EdgeInsets? padding;
  Color color;
  GestureTapCallback? onTap;
   MyBackButton({this.padding,this.onTap,this.color=Colors.white,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){
        Navigator.pop(context);
      },
      child:   Padding(
        padding: padding?? EdgeInsets.symmetric(horizontal: 13,vertical: 18),
        child: Icon(Icons.arrow_back_ios,color: color,),
      ),
    );
  }
}
