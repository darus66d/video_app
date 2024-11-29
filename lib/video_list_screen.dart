import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListScreen extends StatefulWidget {

  late String videoUrl;

  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  late String videoID;

  @override
  void initState() {
    videoID = YoutubePlayer.convertUrlToId(videoUrl)!;
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
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: YoutubePlayer(
        controller: ytController,
      ),
    ),;
  }
}
