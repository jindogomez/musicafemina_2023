import 'package:musicafemina/MapContent/Demokratie/demokratie_video.dart';

class VideoUrls {
  final videoClara = 'https://www.musicafeminainternational.eu/mf/ClaraSchumann.mp4';
  final videoBaker = 'https://www.musicafeminainternational.eu/mf/JosephineBaker.mp4';
  final videoNs = 'https://www.musicafeminainternational.eu/mf/Die_Verfemten.mp4';

  final videoWiener1 =
      'https://www.musicafeminainternational.eu/mf/WienerK_Maria_Theresia_Paradis.mp4';

  final videoWiener2 =
      'https://www.musicafeminainternational.eu/mf/WienerK_MariannavonMartines.mp4';

  final videoStrauss1 =
      'https://www.musicafeminainternational.eu/mf/strauss/PalaisCoburg.mp4';
  final videoStrauss2 =
      'https://www.musicafeminainternational.eu/mf/strauss/Spiegelgasse.mp4';
  final videoStrauss3 =
      'https://www.musicafeminainternational.eu/mf/strauss/Musikverein.mp4';
  final videoStrauss4 =
      'https://www.musicafeminainternational.eu/mf/strauss/Zieglergasse.mp4';
  final videoStrauss5 = 'https://www.musicafeminainternational.eu/mf/strauss/03 Wiedner Hauptstraße.mp4';
  final videoStrauss6 =
      'https://www.musicafeminainternational.eu/mf/strauss/Landstraße.mp4';



  final videoStrauss8 =
      'https://www.musicafeminainternational.eu/mf/strauss/Nussdorf.mp4';

  Map<String, String> get namedWienerUrls => {
        'Maria Theresia Paradis': videoWiener1,
        'Marianna von Martines': videoWiener2,
      };

  Map<String, String> get namedStraussUrls => {
        'Palais Coburg': videoStrauss1,
        'Spiegelgasse': videoStrauss2,
        'Musikverein': videoStrauss3,
        'Zieglergasse': videoStrauss4,
        'Wiedner Hauptstraße ': videoStrauss5,
        'Landstraße Hauptstraße ': videoStrauss6,
        
        'Nussdorf Donau Schifffahrt': videoStrauss8,
      };

  Map<String, String> get namedDemokratieUrls => {
        'Kelsen-Institut': videoDemokratie1,
        'Strudelhofstiege': videoDemokratie2,
        'Cafe Landtmann': videoDemokratie3,
        'Erster Wiener Frauenclub': videoDemokratie4,
        'Eugenie Schwarzwald-Schule': videoDemokratie5,
        'Grete-Rehor-Park': videoDemokratie6,
        'Musikverein': videoDemokratie7,
        
      };
}