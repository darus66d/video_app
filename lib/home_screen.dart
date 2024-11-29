import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

late YoutubePlayerController ytController;
 String videoUrl= "https://www.youtube.com/watch?v=JnX7Oc8LqD8&t=269s";

  @override
  void initState() {
    videoUrl = YoutubePlayer.convertUrlToId(videoUrl)!;
    print(videoUrl);
    // TODO: implement initState
    super.initState();
    ytController = YoutubePlayerController(
        initialVideoId: videoUrl,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      )
    );
  }

  /*YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'HM_OGtwR2jM',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video_Project"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: YoutubePlayer(
                controller: ytController,
               /* showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  _controller.addListener(listener);
                },*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}