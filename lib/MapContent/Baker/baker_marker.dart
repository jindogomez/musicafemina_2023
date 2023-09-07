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
  required String title,
  required String address,
  required int locationIndex,
  required String text,
  required List<Pair<String, String>> imageSubtextPairs,
  required int audioIndex,
  LatLng? music,
}) {
  return MapMarkerBaker(
    title: title,
    backgroundImage: blankImage,
    address: address,
    location: WayBaker.getLatLng(locationIndex),
    text: text,
    imageSubtextPairs: imageSubtextPairs,
    audioClip: AudioPathBaker.getAudioPath(audioIndex),
    music: music,
  );
}

final mapMarkers = [
  createMarker(
    title: BakerText.getTitle(1),
    address: BakerText.getAddress(1),
    text: BakerText.getText(1),
    locationIndex: 1,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList1),
    audioIndex: 1,
  ),
  createMarker(
    title: BakerText.getTitle(2),
    address: BakerText.getAddress(2),
    text: BakerText.getText(2),
    locationIndex: 2,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList2),
    audioIndex: 1,
  ),
  createMarker(
    title: BakerText.getTitle(3),
    address: BakerText.getAddress(3),
    text: BakerText.getText(3),
    locationIndex: 3,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList3),
    audioIndex: 1,
  ),
  createMarker(
    title: BakerText.getTitle(4),
    address: BakerText.getAddress(4),
    text: BakerText.getText(4),
    locationIndex: 4,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList4),
    audioIndex: 1,
  ),
  createMarker(
    title: BakerText.getTitle(5),
    address: BakerText.getAddress(5),
    text: BakerText.getText(5),
    locationIndex: 5,
    imageSubtextPairs: createImageSubtextPairs(imageSubtextsList5),
    audioIndex: 1,
  ),
];
