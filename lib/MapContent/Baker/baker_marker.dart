import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/Baker/baker_text.dart';
import 'bakar_pair_images.dart';
import 'baker_audio_urls.dart';
import 'baker_polylines.dart';

const String blankImage = 'assets/images/blank.png';

class MapMarkerBaker {
  final List<Pair<String, String>> imageSubtextPairs;
  final String? backgroundImage;

  final String? title;
  final String? address;
  final String? text;
  final LatLng? location;
  final LatLng? music;
  final String? audioClip;

  MapMarkerBaker({
    required this.backgroundImage,
    required this.imageSubtextPairs,
    required this.audioClip,
    required this.title,
    required this.text,
    required this.address,
    required this.location,
    this.music,
  });
}

MapMarkerBaker createMarker({
  required int textsindex,
  required int locationIndex,
  required List<Pair<String, String>> imageSubtextPairs,
  required int audioIndex,
  LatLng? music,
}) {
  return MapMarkerBaker(
    title: BakerText.titles[textsindex - 1],
    address: BakerText.addresses[textsindex - 1],
    text: BakerText.texts[textsindex - 1],
    backgroundImage: blankImage,
    location: WayBaker.getLatLng(locationIndex),
    imageSubtextPairs: imageSubtextPairs,
    audioClip: AudioPathBaker.getAudioPath(audioIndex),
    music: music,
  );
}

final mapMarkers = [
  createMarker(
    textsindex: 1,
    locationIndex: 1,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList1),
    audioIndex: 1,
  ),
  createMarker(
    textsindex: 2,
    locationIndex: 2,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList2),
    audioIndex: 2,
  ),
  createMarker(
    textsindex: 3,
    locationIndex: 3,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList3),
    audioIndex: 3,
  ),
  createMarker(
    textsindex: 4,
    locationIndex: 4,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList4),
    audioIndex: 4,
  ),
  createMarker(
    textsindex: 5,
    locationIndex: 5,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList5),
    audioIndex: 5,
  ),
];
