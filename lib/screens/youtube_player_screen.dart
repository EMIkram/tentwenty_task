import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty_task/utils/color_palatte.dart';
import 'package:tentwenty_task/widgets/my_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatelessWidget {
  String youtubeVideoKey;
   YoutubePlayerScreen(this.youtubeVideoKey,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: youtubeVideoKey,
      flags:const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Scaffold(

      backgroundColor: Colors.black,
      body: WillPopScope(
        onWillPop: (){
          _controller.dispose();
         return Future.value(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton(onPressed: (){
                _controller.dispose();
                Get.back();
              }, child: MyText("Done",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorPalette.white_F6F6FA,
              ))
            ],),
           const Spacer(),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: () {
            // _controller.addListener(listener);
            },
            ),
            const Spacer(),
          ],
        ),
      ),


    );
  }
}
