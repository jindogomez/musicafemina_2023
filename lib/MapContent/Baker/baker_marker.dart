/// TODO:
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/Baker/baker_polylines.dart';

const String path = 'assets/images/Baker/';
const String pathaudio = 'assets/audio/baker/';

class MapMarkerBaker {
  //Bilder und Bild Untertitel für die Cards -> Pair (Bild, Untertitel)
  final List<Pair<String, String>> imageSubtextPairs;
  final String? backgroundImage;
  final String? audioClip;
  final String? title;
  final String? address;
  final String? text;
  final LatLng? location;
  final LatLng? music;

  static double latX = WayBaker.coor1;

  MapMarkerBaker({
    required this.backgroundImage,
    required this.imageSubtextPairs,
    required this.audioClip,
    required this.title,
    required this.text,
    required this.address,
    required this.location,
    required this.music,
  });
}

final mapMarkers = [
  //Parlament
  MapMarkerBaker(
      title: 'Josephine Baker',
      backgroundImage:
          'assets/images/baker_img/baker_parlament/mf_baker_02_header.png',
      address: 'Kärntner Durchgang',
      location: const LatLng(48.2071834219, 16.371258207246),
      text:
          'Strohkoffer, heute der Keller unter der American Loos Bar: Alfred Schmeller, der Kunsthistoriker, fand für den Artclub ein neues Lokal im Kärntnerdurchgang, den Keller unter der American Bar, die Alfred Loos im Jahre 1908 entworfen hatte. Dieser KünstlerInnen-Treffpunkt, der seinen Namen nach den mit Strohmatten ausgelegten Wänden hatte, bestand von 1951 bis 1953. Als 1952 das „Porgy and Bess-Ensemble“ in Wien gastierte – bekanntlich hatte George Gershwin seine Oper black singers reserviert – war der Strohkoffer das einzige Lokal in Wien, wo die Gäste willkommen waren – darunter Leontyne Price und Cab Calloway.',
      imageSubtextPairs: [
        Pair('assets/images/baker_img/baker_kaerntner/kaerntnerst_baker1.jpg',
            ''),
        Pair(
            'assets/images/baker_img/baker_kaerntner/kaerntnerst_baker_tanz.jpg',
            ''),
        Pair('assets/images/baker_img/baker_kaerntner/kaerntnerst_baker_2.jpg',
            ''),
      ],
      audioClip: 'assets/audio/baker_audio/baker_strohkoffer.mp3',
      music: null),
];
