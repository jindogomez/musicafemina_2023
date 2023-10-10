// Defines a constant path where all audio files are located.
const String audioPath = 'assets/audio/baker/';

// Utility class for handling audio paths.
class AudioPathBaker {
  // A private, constant list of audio file paths. Each path is constructed
  // by combining a constant directory path with the individual audio file name.
  static const List<String> _audioPaths = [
    '${audioPath}baker_parlament.mp3', // Parlament -> audioIndex: 1
    '${audioPath}baker_strohkoffer.mp3', // Kärntner Durchgang -> audioIndex: 2
    '${audioPath}baker_ronacher.mp3', // Seilerstätte 9 -> audioIndex: 3
    '${audioPath}baker_bristol.mp3', // Kärntner Ring 1 -> audioIndex: 4
    '${audioPath}baker_strausstheater.mp3', // Favoritenstraße 8 -> audioIndex: 5
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
