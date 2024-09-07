// Defines a constant path where all audio files are located.
const String audioPath = 'assets/audio/baker_audio/';

// Utility class for handling audio paths.
class AudioPathBaker {
  // A private, constant list of audio file paths. Each path is constructed
  // by combining a constant directory path with the individual audio file name.
  static const List<String> _audioPaths = [
    '${audioPath}baker_parlament.mp3', // Parlament
    '${audioPath}baker_strohkoffer.mp3', // Kärntner Durchgang
    '${audioPath}baker_ronacher.mp3', // Seilerstätte 9
    '${audioPath}baker_bristol.mp3', // Kärntner Ring 1
    '${audioPath}baker_strausstheater.mp3', // Favoritenstraße 8
  ];

  static String getAudioPath(int index) {
    if (index >= 0 && index < _audioPaths.length) {
      return _audioPaths[index];
    } else {
      throw ArgumentError('No audio path found for the given index');
    }
  }
}
