import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoTab extends StatefulWidget {
  @override
  State<VideoTab> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {

  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController = VideoPlayerController.asset("assets/sample.mp4");
    _initializeVideoPlayer = _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 150,
            color: Colors.black,
            child: FutureBuilder(
              future: _initializeVideoPlayer,
              builder: (context, snapshot){
                return AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Share.share('Check out this video:\n https://demodeeplink.com/video'),
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}
