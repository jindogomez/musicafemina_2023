import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicafemina/Services/music_manegar.dart';
import 'package:musicafemina/Style/app_style.dart';


class AudioButtonWidget extends StatefulWidget {
  final String audioUrl;

  const AudioButtonWidget({Key? key, required this.audioUrl}) : super(key: key);

  @override
  AudioButtonWidgetState createState() => AudioButtonWidgetState();
}

class AudioButtonWidgetState extends State<AudioButtonWidget> {
  final AudioManager _audioManager = AudioManager();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: _audioManager.musicPlayerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        IconData icon = Icons.play_arrow; 
VoidCallback action = () async {
  await _audioManager.stopAll(); 
  await _audioManager.playMusic(widget.audioUrl); 
  if (mounted) {
    setState(() {}); 
  }
};



        if (playing == true && processingState != ProcessingState.completed) {
          icon = Icons.pause;
          action = _audioManager.pauseMusic; 
        } else if (processingState == ProcessingState.completed) {
          icon = Icons.replay;
          action = () => _audioManager.playMusic(widget.audioUrl); 
        }

        return ElevatedButton.icon(
          label: Text('"March of the Women" von REIHE Zykan abspielen', style: TextStyle(color: Styles.primaryColor)), 
          icon: Icon(icon, color: Styles.primaryColor),
          onPressed: action,
          style: ElevatedButton.styleFrom(
            foregroundColor: Styles.primaryColor, backgroundColor: Colors.white, ),
        );
      },
    );
  }
}
