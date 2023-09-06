/// TODO:
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/Baker/baker_polylines.dart';

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
    imageSubtextPairs: [
      Pair('assets/images/baker/.jpg', ''),
      Pair('assets/images/baker/.jpg', ''),
      Pair('assets/images/baker/.jpg', ''),
    ],
    audioClip: 'assets/audio/baker/parlament.mp3',
    music: null,
    backgroundImage:
        'assets/images/baker/baker_parlament/mf_baker_01_header.png',
    title: 'Parlament',
    address: 'Parlament',
    text: "",
    location: const LatLng(48.20822420870148, 16.35858684802273),
  ),
];
