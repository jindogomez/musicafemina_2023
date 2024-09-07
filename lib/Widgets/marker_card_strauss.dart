import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';
import '../Style/app_style.dart';
import 'package:musicafemina/MapContent/Strauss/strauss_marker.dart';
import 'package:musicafemina/MapContent/Strauss/video_class.dart';
import 'package:musicafemina/Widgets/audio_button_strauss.dart';

class MarkerCard extends StatefulWidget {
  final bool isCardVisible;
  final int? selectedMarkerIndex;
  final AudioPlayer audioPlayer;
  final ValueNotifier<bool> isPlaying;
  final void Function(String?, void Function(void Function())) playPauseAudio;
  final Future<void> Function(String?) restartAudio;

  const MarkerCard(
    this.isCardVisible,
    this.selectedMarkerIndex,
    this.audioPlayer,
    this.isPlaying,
    this.playPauseAudio,
    this.restartAudio, {
    Key? key,
  }) : super(key: key);

  @override
  MarkerCardState createState() => MarkerCardState();
}

class MarkerCardState extends State<MarkerCard> {
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  bool _isError = false;
  bool _isPlaying = false;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.selectedMarkerIndex != null && widget.isCardVisible) {
      _initializeVideo(widget.selectedMarkerIndex!);
    }
  }

  @override
  void didUpdateWidget(MarkerCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isCardVisible != widget.isCardVisible) {
      if (!widget.isCardVisible) {
        _resetVideo();
        _stopAudioAndResetButton();
      } else if (widget.selectedMarkerIndex != null) {
        _initializeVideo(widget.selectedMarkerIndex!);
      }
    }

    if (oldWidget.selectedMarkerIndex != widget.selectedMarkerIndex) {
      if (widget.selectedMarkerIndex != null) {
        _initializeVideo(widget.selectedMarkerIndex!);
      }
    }
  }

  void _initializeVideo(int index) {
    _resetVideo(); // Ensure previous video controller is disposed
    String videoPath = VideoPathStrauss.getVideoPath(index);
    _videoController = VideoPlayerController.networkUrl(Uri.parse(videoPath))
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
          _isError = false;
          _videoController!.setLooping(true);
        });
      }).catchError((error) {
        setState(() {
          _isError = true;
        });
      });
  }

  void _toggleVideoPlayback() {
    setState(() {
      if (_videoController!.value.isPlaying) {
        _videoController!.pause();
        _isPlaying = false;
      } else {
        _videoController!.play();
        _isPlaying = true;
      }
    });
  }

  void _stopAudioAndResetButton() {
    widget.audioPlayer.stop();
    widget.isPlaying.value = false;
  }

  void _resetVideo() {
    if (_videoController != null) {
      _videoController!.dispose();
      _videoController = null;
    }
    _isVideoInitialized = false;
    _isPlaying = false;
    _isError = false;
    _isButtonVisible = false;
  }

  void disposeVideo() {
    _resetVideo();
  }

  void initializeVideoAgain() {
    if (widget.selectedMarkerIndex != null) {
      _initializeVideo(widget.selectedMarkerIndex!);
    }
  }

  @override
  void dispose() {
    _resetVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Visibility(
      visible: widget.isCardVisible,
      child: Align(
        alignment: Alignment.center,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Styles.polyColorStrauss,
              width: 3,
            ),
          ),
          margin: EdgeInsets.zero,
          child: SizedBox(
            width: width,
            height: height,
            child: widget.selectedMarkerIndex != null
                ? Padding(
                    padding: const EdgeInsets.all(1),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(mapMarkers[widget.selectedMarkerIndex!]
                              .backgroundImage),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 600),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                const SizedBox(height: 15),
                                Text(mapMarkers[widget.selectedMarkerIndex!].title,
                                    style: Styles.headline),
                                Text(
                                  mapMarkers[widget.selectedMarkerIndex!].address,
                                  style: Styles.textStyle1,
                                ),
                                const SizedBox(height: 15),
                                AudioControls(
                                  mapMarkers: mapMarkers,
                                  selectedMarkerIndex: widget.selectedMarkerIndex,
                                  playPauseAudio: widget.playPauseAudio,
                                  restartAudio: widget.restartAudio,
                                  audioPlayer: widget.audioPlayer,
                                  isPlaying: widget.isPlaying,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  mapMarkers[widget.selectedMarkerIndex!].text,
                                  style: Styles.textMain,
                                ),
                                const SizedBox(height: 20),
                                _isError
                                    ? const Text('')
                                    : _isVideoInitialized
                                        ? InkWell(
                                            onTap: _toggleVideoPlayback,
                                            onTapDown: (_) {
                                              setState(() {
                                                _isButtonVisible = true;
                                              });
                                            },
                                            onTapUp: (_) {
                                              Future.delayed(const Duration(seconds: 2), () {
                                                setState(() {
                                                  _isButtonVisible = false;
                                                });
                                              });
                                            },
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: _videoController!.value.aspectRatio,
                                                  child: VideoPlayer(_videoController!),
                                                ),
                                                if (_isButtonVisible || !_isPlaying)
                                                  Positioned.fill(
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Icon(
                                                        _isPlaying ? Icons.pause : Icons.play_arrow,
                                                        size: 60.0,
                                                        color: Styles.primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          )
                                        : CircularProgressIndicator(color: Styles.primaryColor),
                                const SizedBox(height: 15),
                                for (Pair<String, String> imageSubtextPair
                                    in mapMarkers[widget.selectedMarkerIndex!]
                                        .imageSubtextPairs)
                                  Column(
                                    children: [
                                      Image.asset(imageSubtextPair.first),
                                      Text(
                                        imageSubtextPair.last,
                                        style: Styles.textMain,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
