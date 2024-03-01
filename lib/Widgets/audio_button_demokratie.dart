import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicafemina/MapContent/Demokratie/demokratie_marker.dart';

import 'package:musicafemina/Services/music_manegar.dart';
import '../Style/app_style.dart';

typedef UpdateCallback = void Function(VoidCallback update);

class AudioControls extends StatefulWidget {
  final List<MapMarkerDemokratie> mapMarkers;
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

  final AudioManager _audioManager = AudioManager();

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder<bool>(
      valueListenable: _audioManager.isMusicPlaying,
      builder: (_, isPlaying, __) {
        return Center(
          child: Container(
            width: 110,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: const Color.fromARGB(255, 207, 185, 185),
              border: Border.all(
                color: Styles.primaryColor,
                width: 0.2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Play/Pause Button
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Styles.bgColor,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Styles.primaryColor,
                    ),
                    onPressed: () async {
                      if (isPlaying) {
                        _audioManager.pauseMusic(); 
                      } else {
         
                        await _audioManager.stopAll();
                       
                        await _audioManager.playMusic(widget.mapMarkers[widget.selectedMarkerIndex!].audioClip);
                      }
                    },
                  ),
                ),

                // Restart Button
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: Styles.bgColor,
                    radius: 22,
                    child: IconButton(
                      icon: Icon(Icons.restart_alt, color: Styles.primaryColor),
                      onPressed: () async {
                
                        await _audioManager.playMusic(widget.mapMarkers[widget.selectedMarkerIndex!].audioClip);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
