// Defines a constant path where all audio files are located.
const String audioPath = 'assets/audio/wiener_audio/';


// Utility class for handling audio paths.
class AudioPathWiener {
  // A private, constant list of audio file paths. Each path is constructed
  // by combining a constant directory path with the individual audio file name.
  static const List<String> _audioPaths = [
    '${audioPath}wiener_stmarxerfriedhof.mp3', // Wiener St. Marxer Friedhof
    '${audioPath}wiener_rasumovskygasse29.mp3', // Wiener Rasumovskygasse 29
    '${audioPath}wiener_ungargasse46.mp3', // Wiener Ungargasse 46
    '${audioPath}wiener_baeckerstrasse13.mp3', // Wiener Baeckerstrasse 13
    '${audioPath}wiener_stmichael.mp3', // Wiener St. Michael
    '${audioPath}wiener_rabensteig8.mp3', // Wiener Rabensteig 8
    '${audioPath}wiener_helferstorferstrasse.mp3', //Helferstorferstraße Josepha Müllner

    '${audioPath}wiener_himmelpfortgasse6.mp3', // Wiener Himmelpfortgasse 6

    '${audioPath}wiener_kohlmarkt_michaelerhaus.mp3', // Wiener Kohlmarkt Michaelerhaus

    '${audioPath}wiener_augustinerkirche.mp3', // Wiener Augustinerkirche
    '${audioPath}wiener_karlsplatz_musikfreunde.mp3', // Wiener Karlsplatz Musikfreunde
    '${audioPath}wiener_florianigasse_kochgasse.mp3', // Wiener Florianigasse Kochgasse
  ];

  static String getAudioPath(int index) {
    if (index >= 0 && index < _audioPaths.length) {
      return _audioPaths[index];
    } else {
      throw ArgumentError('No audio path found for the given index');
    }
  }
}
