// Defines a constant path where all audio files are located.
const String audioPath = 'assets/audio/strauss_audio/';

// Utility class for handling audio paths.
class AudioPathStrauss {
  // A private, constant list of audio file paths. Each path is constructed
  // by combining a constant directory path with the individual audio file name.
  static const List<String> _audioPaths = [
    '${audioPath}strauss_karlsplatz.mp3', // Karlsplatz  -> audioIndex: 1
    '${audioPath}strauss_landstrasse.mp3', // Landstraßer Hauptstraße  -> audioIndex: 2
    '${audioPath}strauss_nussdorf.mp3',  // Nussdorfer Straße  -> audioIndex: 3
    '${audioPath}strauss_palaiscoburg.mp3', // Coburgbastei  -> audioIndex: 4
    '${audioPath}strauss_prater.mp3', // Prater 1 -> audioIndex: 5
    '${audioPath}strauss_wiedernhaupt.mp3', // Wiedner Hauptstraße  -> audioIndex: 6
    '${audioPath}strauss_zieglergasse.mp3',  // Zieglergasse -> audioIndex: 7
  ];

  // Method to get the audio path based on an index.
  // The index is 1-based, meaning that passing 1 would return the first audio path.
  static String getAudioPath(int index) {
    // Check if the index is within the valid range.
    if (index > 0 && index <= _audioPaths.length) {
      // Return the audio path at the index specified.
      return _audioPaths[index - 1];
    } else {
      // Throw an error if the index is out of range.
      throw ArgumentError('No audio path found for the given index');
    }
  }
}
