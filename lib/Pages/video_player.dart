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
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
      widget.videoUrl,
    ))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      }, onError: (_) {
        setState(() {
          _isError = true;
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
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    if (_isError) {
      return const Text('An error occurred while loading the video');
    }

    if (_controller.value.isInitialized) {
      return RotatedBox(
        quarterTurns: 1, // Adjusted quarter turns
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      );
    }

    return const CircularProgressIndicator();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
