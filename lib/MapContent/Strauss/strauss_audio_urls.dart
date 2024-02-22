// Defines a constant path where all audio files are located.
const String audioPath = 'assets/audio/strauss_audio/';

// Utility class for handling audio paths.
class AudioPathStrauss {

  static const List<String> _audioPaths = [
    '${audioPath}strauss_palaiscoburg.mp3', // Coburgbastei  -> audioIndex: 1
    '${audioPath}strauss_spiegelgasse.mp3', //Spiegelgasse audioIndex: 2
    '${audioPath}strauss_karlsplatz.mp3', // Karlsplatz  -> audioIndex: 3
    '${audioPath}strauss_zieglergasse.mp3', // Zieglergasse -> audioIndex: 4
    '${audioPath}strauss_wiedernhaupt.mp3', // Wiedner Hauptstraße  -> audioIndex: 5
    '${audioPath}strauss_landstrasse.mp3', // Landstraßer Hauptstraße  -> audioIndex: 6
    '${audioPath}strauss_prater.mp3', // Prater 1 -> audioIndex: 7
    '${audioPath}strauss_nussdorf.mp3', // Nussdorfer Straße  -> audioIndex: 8
  ];

  static String getAudioPath(int index) {
    if (index >= 0 && index < _audioPaths.length) {
      return _audioPaths[index];
    } else {
      throw ArgumentError('No audio path found for the given index');
    }
  }
}
