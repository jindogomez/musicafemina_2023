const String audioPath = 'assets/audio/baker/';

class AudioPathBaker {
  static const List<String> _audioPaths = [
    '${audioPath}baker_bristol.mp3',
    '${audioPath}baker_bristol.mp3',
    '${audioPath}baker_bristol.mp3',
    '${audioPath}baker_bristol.mp3',
    '${audioPath}baker_bristol.mp3',
  ];

  static String getAudioPath(int index) {
    if (index > 0 && index <= _audioPaths.length) {
      return _audioPaths[index - 1];
    } else {
      throw ArgumentError('Index out of range');
    }
  }
}
