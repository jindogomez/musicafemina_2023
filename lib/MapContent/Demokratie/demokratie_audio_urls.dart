const String audioPath = 'assets/audio/demokratie_audio/';


// handling audio paths
class AudioPathDemokratie {
  static const List<String> _audioPaths = [
    '${audioPath}odd_gymnasiumstrasse79.mp3', //     1190 Wien, Gymnasiumstraße 79
    '${audioPath}odd_strudlhofstiege.mp3', // 1090 Wien, Strudlhofstiege / Liechtensteinstrasse 51
    '${audioPath}odd_oppolzergasse6.mp3', // 1010 Wien, Oppolzergasse 6
    '${audioPath}odd_grabentuchlauben11.mp3', // 1010 Wien, Graben Tuchlauben 11 / Trattnerhof
    '${audioPath}odd_wallnerstrasse9.mp3', // 1010 Wien, Wallner Straße 9
    '${audioPath}odd_drkarlrennerring1.mp3', // 1010 Wien, Dr. Karl Renner-Ring 1'
    '${audioPath}odd_lothringerstrasse20.mp3', // 1030 Wien, Lothringerstrasse 20
    '${audioPath}odd_karlsplatz.mp3', // 1010 Wien, Karlsplatz
  ];

  static String getAudioPath(int index) {
    if (index >= 0 && index < _audioPaths.length) {
      return _audioPaths[index];
    } else {
      throw ArgumentError('No audio path found for the given index');
    }
  }
}
