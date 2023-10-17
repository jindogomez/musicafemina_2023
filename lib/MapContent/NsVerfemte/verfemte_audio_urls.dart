// Defines a constant path where all audio files are located.
const String audioPath = 'assets/audio/ns_verfemte_audio/';

// Utility class for handling audio paths.
class AudioPathVerfemte {
  // A private, constant list of audio file paths. Each path is constructed
  // by combining a constant directory path with the individual audio file name.
  static const List<String> _audioPaths = [
    '${audioPath}Alserstrasse.mp3', // Alserstrasse
    '${audioPath}Johannesgasse.mp3', // Johannesgasse
    '${audioPath}Kaasgraben.mp3', // Kaasgraben
    '${audioPath}Oppolzergasse.mp3', // Oppolzergasse
    '${audioPath}Rahlgasse.mp3', // Rahlgasse
    '${audioPath}RechteWienzeile.mp3', // Rechte Wienzeile
    '${audioPath}Strozzigasse.mp3', // Strozzigasse
    '${audioPath}Wollzeile.mp3', // Wollzeile
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
