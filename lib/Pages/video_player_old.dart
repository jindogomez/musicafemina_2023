/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Widgets/appbar_videos.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideThumbnail: true,
      ),
    );
    _controller.addListener(listener);
    super.initState();
  }

  void listener() {
    if (_controller.value.playerState == PlayerState.playing &&
        !_controller.value.isFullScreen) {
      _controller.toggleFullScreenMode();
    }
  }

  void exitFullScreen() {
    _controller.toggleFullScreenMode();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true, // allows body to extend behind AppBar
      appBar: CustomAppBarVideos(
        controller: _controller,
        title: '',
        exitFullScreen: exitFullScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0), // padding ändern
        child: YoutubePlayer(
          controller: _controller,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),
            RemainingDuration(),
          ],
          showVideoProgressIndicator: true,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }
}
*/