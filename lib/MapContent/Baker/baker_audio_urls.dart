const String audioPath = 'assets/audio/baker/';

class AudioPathBaker {
  static const List<String> _audioPaths = [
    '${audioPath}baker_parlament.mp3', //parlament ->  audioIndex: 1
    '${audioPath}baker_strohkoffer.mp3', // kärntner durchgang -> audioIndex: 2
    '${audioPath}baker_ronacher.mp3', // seilerstätte 9 -> audioIndex: 3
    '${audioPath}baker_bristol.mp3', // kärntner ring 1 -> audioIndex: 4
    '${audioPath}baker_strausstheater.mp3', // Favoritenstraße 8 -> audioIndex: 5
  ];

  static String getAudioPath(int index) {
    if (index > 0 && index <= _audioPaths.length) {
      return _audioPaths[index - 1];
    } else {
      throw ArgumentError('No audio path found');
    }
  }
}
