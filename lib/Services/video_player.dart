import 'package:flutter/material.dart';
import 'package:musicafemina/Services/video_urls.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../menu.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(VideoUrls().videoClara);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideThumbnail: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.red,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Menu()));
          },
        ),
        title: Image.asset(
          'assets/images/mf_logo_B.png',
          fit: BoxFit.cover,
          height: 80,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
