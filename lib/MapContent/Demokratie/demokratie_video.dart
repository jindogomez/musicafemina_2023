const String videoDemokratie1 = 'https://www.musicafeminainternational.eu/mf/demokratie/02 Kehlseninstitut, Yella Herzka,1.Mädchenschule_1.mp4';
const String videoDemokratie2 = 'https://www.musicafeminainternational.eu/mf/demokratie/01 Strudelhofstiege , INTRO, Berta Zuckerkandl_1.mp4';
const String videoDemokratie3 = 'https://www.musicafeminainternational.eu/mf/demokratie/03 Berta Zuckerkandl_SALONLandtmann,vor Burgtheater.mp4';
const String videoDemokratie4 = 'https://www.musicafeminainternational.eu/mf/demokratie/05 Yella Herzka_erster Wienrer Frauenclub.mp4';
const String videoDemokratie5 = 'https://www.musicafeminainternational.eu/mf/demokratie/04  Eugenia Schwarzwaldschule.mp4';
const String videoDemokratie6 = 'https://www.musicafeminainternational.eu/mf/demokratie/06 Grete Rehor Park_Ministerin -Pension.mp4';
const String videoDemokratie7 = 'https://www.musicafeminainternational.eu/mf/demokratie/empty.mp4'; 
const String videoDemokratie8 = 'https://www.musicafeminainternational.eu/mf/demokratie/09 Musikverein.mp4';

class VideoPathDemokratie {
  static const List<String> _videoPaths = [
    videoDemokratie1,
    videoDemokratie2,
    videoDemokratie3,
    videoDemokratie4,
    videoDemokratie5,
    videoDemokratie6,
    videoDemokratie7,
    videoDemokratie8,
  ];

  static String getVideoPath(int index) {
    if (index >= 0 && index < _videoPaths.length) {
      return _videoPaths[index];
    } else {
      throw ArgumentError('No video path found for the given index');
    }
  }
}
