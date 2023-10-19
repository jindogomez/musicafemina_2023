import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioManager {
  late final AudioPlayer audioPlayer;
  String? lastAudioClip;
  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);
  bool _isDisposed = false;

AudioManager() {
  try {
    audioPlayer = AudioPlayer();
  } catch (e) {
    errorMessage.value = 'Error occurred during audio player initialization: $e';
  }
}

  Future<void> playPauseAudio(
      String? audioClip, UpdateCallback updateUI) async {
    if (audioClip == null) {
      errorMessage.value = 'Audio clip cannot be null';
      return;
    }

    try {
      if (audioPlayer.playing) {
        await audioPlayer.pause();
        if (!_isDisposed) {
          updateUI(() => isPlaying.value = false);
        }
      } else {
        if (lastAudioClip != audioClip ||
            audioPlayer.processingState == ProcessingState.completed) {
          await audioPlayer.stop();
          await audioPlayer.setAsset(audioClip);
          lastAudioClip = audioClip;
        }
        await audioPlayer.play();
        if (!_isDisposed) {
          updateUI(() => isPlaying.value = true);
        }
      }
    } catch (e) {
      errorMessage.value = 'Error occurred: $e';
    }
  }

  Future<void> restartAudio(String? audioClip) async {
    if (audioClip == null) {
      errorMessage.value = 'Audio clip cannot be null';
      return;
      
    }
    

    try {
      await audioPlayer.stop();
      await audioPlayer.setAsset(audioClip);
      await audioPlayer.play();
      isPlaying.value = true;
    } catch (e) {
      errorMessage.value = 'Error occurred: $e';
    }
  }

  void dispose() {
    audioPlayer.pause();
    audioPlayer.dispose();
    _isDisposed = true;
  }
}

typedef UpdateCallback = void Function(Function updateUI);
