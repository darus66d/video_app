import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListScreen extends StatefulWidget {

  final String videoUrl;

  const VideoListScreen({super.key, required this.videoUrl});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  late YoutubePlayerController ytController;

  late String videoID;


  @override
  void initState() {
    videoID = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    // TODO: implement initState
    super.initState();
    ytController = YoutubePlayerController(
        initialVideoId: videoID,
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
    );
  }
}
