import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicafemina/MapContent/Strauss/strauss_marker.dart';

import '../Style/app_style.dart';



typedef UpdateCallback = void Function(VoidCallback update);

class AudioControls extends StatefulWidget {
  final List<MapMarkerStrauss> mapMarkers;
  final int? selectedMarkerIndex;
  final void Function(String?, UpdateCallback) playPauseAudio;
  final Future<void> Function(String?) restartAudio;
  final AudioPlayer audioPlayer;
  final ValueNotifier<bool> isPlaying;
  const AudioControls({
    Key? key,
    required this.mapMarkers,
    required this.selectedMarkerIndex,
    required this.playPauseAudio,
    required this.restartAudio,
    required this.audioPlayer,
    required this.isPlaying,
  }) : super(key: key);

  @override
  State<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: const Color.fromARGB(255, 207, 185, 185),
          border: Border.all(
            color: Styles.primaryColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Play/Pause Button
            ValueListenableBuilder(
              valueListenable: widget.isPlaying,
              builder: (BuildContext context, bool isPlaying, Widget? child) {
                return CircleAvatar(
                  radius: 20,
                  backgroundColor: Styles.bgColor,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Styles.primaryColor,
                      ),
                      iconSize: 20,
                      splashColor: Colors.orange,
                      highlightColor: Colors.orange,
                      onPressed: () {
                        widget.playPauseAudio(
                          widget.mapMarkers[widget.selectedMarkerIndex!]
                              .audioClip,
                          (update) => setState(update),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Styles.bgColor,
              radius: 20,
              child: IconButton(
                icon: Icon(Icons.restart_alt, color: Styles.primaryColor),
                iconSize: 20,
                splashColor: Colors.orange,
                highlightColor: Colors.orange,
                onPressed: () async {
                  await widget.restartAudio(
                      widget.mapMarkers[widget.selectedMarkerIndex!].audioClip);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
