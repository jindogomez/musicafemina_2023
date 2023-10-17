// Defines a constant path where all audio files are located.
const String audioPath = 'assets/audio/wiener_audio/';

// Utility class for handling audio paths.
class AudioPathWiener {
  // A private, constant list of audio file paths. Each path is constructed
  // by combining a constant directory path with the individual audio file name.
 static const List<String> _audioPaths = [
    '${audioPath}auernhammerbäckerstrasse.mp3', // Auernhammerbäckerstraße
    '${audioPath}auernhammerhimmelpfortgasse.mp3', // Auernhammer Himmelpfortgasse
    '${audioPath}blahetkaflorianigasse.mp3', // Blahetka Florianigasse
    '${audioPath}gollenhofer.mp3', // Gollenhofer
    '${audioPath}martinezmichaelerhaus.mp3', // Martinez Michaelerhaus
    '${audioPath}martinezmichaelerkirche.mp3', // Martinez Michaelerkirche
    '${audioPath}nanettekarlsplatz.mp3', // Nanette Karlsplatz
    '${audioPath}nanettestreichermarxerfriedhof.mp3', // Nanette Streicher Marxerfriedhof
    '${audioPath}nanettestreicherungargasse.mp3', // Nanette Streicher Ungargasse
    '${audioPath}paradisaugustinerkirche.mp3', // Paradis Augustinerkirche
    '${audioPath}paradisrabensteig.mp3', // Paradis Rabensteig
    '${audioPath}paradisrasumovskygasse.mp3', // Paradis Rasumovskygasse
    '${audioPath}wiener_augustinerkirche.mp3', // Wiener Augustinerkirche
    '${audioPath}wiener_baeckerstrasse13.mp3', // Wiener Baeckerstrasse 13
    '${audioPath}wiener_florianigasse_kochgasse.mp3', // Wiener Florianigasse Kochgasse
    '${audioPath}wiener_himmelpfortgasse6.mp3', // Wiener Himmelpfortgasse 6
    '${audioPath}wiener_karlsplatz_musikfreunde.mp3', // Wiener Karlsplatz Musikfreunde
    '${audioPath}wiener_kohlmarkt_michaelerhaus.mp3', // Wiener Kohlmarkt Michaelerhaus
    '${audioPath}wiener_rabensteig8.mp3', // Wiener Rabensteig 8
    '${audioPath}wiener_rasumovskygasse29.mp3', // Wiener Rasumovskygasse 29
    '${audioPath}wiener_stmarxerfriedhof.mp3', // Wiener St. Marxer Friedhof
    '${audioPath}wiener_stmichael.mp3', // Wiener St. Michael
    '${audioPath}wiener_ungargasse46.mp3', // Wiener Ungargasse 46
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
