import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  final AudioPlayer _musicPlayer;
  final AudioPlayer _effectsPlayer; 


  final ValueNotifier<bool> isMusicPlaying = ValueNotifier(false);

  AudioManager._internal()
      : _musicPlayer = AudioPlayer(),
        _effectsPlayer = AudioPlayer() { 
    _musicPlayer.playerStateStream.listen((state) {
      isMusicPlaying.value = state.playing;
    });
  }

  factory AudioManager() => _instance;


  Future<void> stopAll() async {
    await _musicPlayer.stop();
    await _effectsPlayer.stop(); 
      isMusicPlaying.value = false;
  }

  Future<void> playMusic(String url) async {
    await _musicPlayer.stop(); 

      await _musicPlayer.setUrl(url);
      _musicPlayer.play();
    
  }


  Future<void> playEffect(String assetPath) async {
    await _effectsPlayer.stop(); 

      await _effectsPlayer.setAsset(assetPath);
      _effectsPlayer.play();
   }

  void pauseMusic() {
    _musicPlayer.pause();
  }


  void stopMusic() {
    _musicPlayer.stop();
  }

  Stream<PlayerState> get musicPlayerStateStream => _musicPlayer.playerStateStream;


  void dispose() {
    _musicPlayer.dispose();
    _effectsPlayer.dispose(); 
}
}
