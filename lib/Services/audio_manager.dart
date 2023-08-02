// audio_manager.dart

import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

typedef UpdateCallback = Function(VoidCallback callback);

class AudioManager {
  late AudioPlayer audioPlayer;
  String? lastAudioClip;
  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);

  AudioManager() {
    audioPlayer = AudioPlayer();
  }

  /// Play or pause audio
  Future<void> playPauseAudio(
      String? audioClip, UpdateCallback updateUI) async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
      updateUI(() => isPlaying.value = false);
    } else {
      if (lastAudioClip != audioClip ||
          audioPlayer.processingState == ProcessingState.completed) {
        await audioPlayer.stop();
        await audioPlayer.setAsset(audioClip!);
        lastAudioClip = audioClip;
      }
      await audioPlayer.play();
      updateUI(() => isPlaying.value = true);
    }
  }

  /// Restart audio
  Future<void> restartAudio(String? audioClip) async {
    await audioPlayer.stop();
    await audioPlayer.setAsset(audioClip!);
    await audioPlayer.play();
    isPlaying.value = true;
  }

  void dispose() {
    audioPlayer.dispose();
  }
}
