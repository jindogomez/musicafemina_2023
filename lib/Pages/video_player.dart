import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicafemina/Widgets/appbar_videos.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  VideoPlayerPageState createState() => VideoPlayerPageState();
}

class VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
      widget.videoUrl,
    ));
    _controller.initialize().then((_) {
      setState(() {
        _controller.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBarVideos(
        title: '',
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? RotatedBox(
                quarterTurns: 5,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
