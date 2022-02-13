import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  EdgeInsets? padding;
  Color color;
   MyBackButton({this.padding,this.color=Colors.white,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child:   Padding(
        padding: padding?? EdgeInsets.symmetric(horizontal: 13,vertical: 18),
        child: Icon(Icons.arrow_back_ios,color: color,),
      ),
    );
  }
}
