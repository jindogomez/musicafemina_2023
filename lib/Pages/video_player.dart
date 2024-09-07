import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicafemina/Pages/menu.dart';
import 'package:musicafemina/Style/app_style.dart';
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
  bool _isPlaying = false;
  bool _isControllerVisible = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    // Lock device orientation to landscape
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _controller.play();
            _isPlaying = true;
          });
        }
      }).catchError((error) {
        if (mounted) {
          setState(() {
            _isError = true;
          });
        }
      });

    _controller.addListener(() {
      if (_controller.value.hasError) {
        if (mounted) {
          setState(() {
            _isError = true;
          });
        }
      }
    });
  }

  void _togglePlayback() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  void _toggleControls() {
    setState(() {
      _isControllerVisible = !_isControllerVisible;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            _controller.pause();
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu(paramHomepage: 'menue',)));
          },
        ),
      ),
      body: Center(
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    if (_isError) {
      return const Text(
        'Video konnte nicht geladen werden, vergewissere dich '
        'dass du mit dem Internet verbunden bist.',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      );
    }

    if (_controller.value.isInitialized) {
      return GestureDetector(
        onTap: _toggleControls,
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotatedBox(
              quarterTurns: 0, // Adjust if needed
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            if (_isControllerVisible)
              Positioned(
                bottom: 20,
                child: IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  onPressed: _togglePlayback,
                ),
              ),
          ],
        ),
      );
    }

    return  CircularProgressIndicator(color:Styles.primaryColor);
  }
}