// Defines a constant path where all audio files are located.
const String audioPath = 'assets/audio/ns_audio/';

// Utility class for handling audio paths.
class AudioPathVerfemte {
  // A private, constant list of audio file paths. Each path is constructed
  // by combining a constant directory path with the individual audio file name.
  static const List<String> _audioPaths = [
    
    '${audioPath}ns_rechtewienzeile.mp3', // Rechte Wienzeile
    '${audioPath}ns_strozzigasse.mp3', // Strozzigasse
    '${audioPath}ns_kaasgraben.mp3', // Kaasgraben
    '${audioPath}ns_alserstrasse.mp3', // Alserstrasse
    '${audioPath}ns_ns_oppolzergasse.mp3', // Oppolzergasse
    '${audioPath}ns_wollzeile.mp3', // Wollzeile
    '${audioPath}ns_johannesgasse.mp3', // Johannesgasse
    '${audioPath}ns_rahlgasse.mp3', // Rahlgasse
  ];

  static String getAudioPath(int index) {
    if (index >= 0 && index < _audioPaths.length) {
      return _audioPaths[index];
    } else {
      throw ArgumentError('No audio path found for the given index');
    }
  }
}
