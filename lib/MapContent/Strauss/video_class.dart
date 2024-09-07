const String videoStrauss1 = 'https://www.musicafeminainternational.eu/mf/strauss/PalaisCoburg.mp4';
const String videoStrauss2 = 'https://www.musicafeminainternational.eu/mf/strauss/Spiegelgasse.mp4';
const String videoStrauss3 = 'https://www.musicafeminainternational.eu/mf/strauss/Musikverein.mp4';
const String videoStrauss4 = 'https://www.musicafeminainternational.eu/mf/strauss/Zieglergasse.mp4';
const String videoStrauss5 = 'https://www.musicafeminainternational.eu/mf/strauss/03 Wiedner Hauptstraße.mp4';
const String videoStrauss6 = 'https://www.musicafeminainternational.eu/mf/strauss/Landstraße.mp4';
const String videoStrauss7 = 'https://www.musicafeminainternational.eu/mf/strauss/kommtbald.mp4'; 
const String videoStrauss8 = 'https://www.musicafeminainternational.eu/mf/strauss/Nussdorf.mp4';

class VideoPathStrauss {
  static const List<String> _videoPaths = [
    videoStrauss1,
    videoStrauss2,
    videoStrauss3,
    videoStrauss4,
    videoStrauss5,
    videoStrauss6,
    videoStrauss7,
    videoStrauss8,
  ];

  static String getVideoPath(int index) {
    if (index >= 0 && index < _videoPaths.length) {
      return _videoPaths[index];
    } else {
      throw ArgumentError('No video path found for the given index');
    }
  }
}
