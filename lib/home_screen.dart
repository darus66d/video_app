import 'package:flutter/material.dart';
import 'package:video_app/video_list_screen.dart';
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

   List<String> urls =[
  "https://www.youtube.com/watch?v=JnX7Oc8LqD8&t=269s",
  "https://www.youtube.com/watch?v=39uMLYTh40Q&t=164s",
  "https://www.youtube.com/watch?v=bh5dGdbHCVc&t=89s",
  "https://www.youtube.com/watch?v=d1tf9MMDfWw",
  "https://www.youtube.com/watch?v=d1tf9MMDfWw",
];


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
      body: SingleChildScrollView(
        child: Padding(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(ytController.metadata.title,style: TextStyle(color: Colors.black),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: urls.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1/0.6,

                    ),
                    itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        videoUrl = urls[index];
                        final String? videoID = YoutubePlayer.convertUrlToId(videoUrl);
                        ytController.load(videoID!);
                        setState(() {

                        });

                      },


                        child: VideoListScreen(videoUrl: urls[index],));
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}