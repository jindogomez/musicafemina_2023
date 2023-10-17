import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/Strauss/strauss_pair_images.dart';
import 'package:musicafemina/MapContent/Strauss/strauss_text.dart';
import 'package:musicafemina/MapContent/WienerKlassikerinnen/wiener_audio_urls.dart';
import 'package:musicafemina/MapContent/WienerKlassikerinnen/wiener_polylines.dart';

const String blankImage = 'assets/images/blank.png';

class MapMarkerVerfemte {
  final List<Pair<String, String>> imageSubtextPairs;
  final String backgroundImage;
  final String title;
  final String address;
  final String text;
  final LatLng location;
  final String audioClip;
  final LatLng? music;

  MapMarkerVerfemte._({
    required this.backgroundImage,
    required this.imageSubtextPairs,
    required this.audioClip,
    required this.title,
    required this.text,
    required this.address,
    required this.location,
    this.music,
  });

  factory MapMarkerVerfemte.create({
    required int textsIndex,
    required int locationIndex,
    required List<Pair<String, String>> imageSubtextPairs,
    required int audioIndex,
    LatLng? music,
  }) {
    return MapMarkerVerfemte._(
      backgroundImage: blankImage,
      imageSubtextPairs: imageSubtextPairs,
      audioClip: AudioPathWiener.getAudioPath(audioIndex),
      title: StraussText.getText(textsIndex),
      text: StraussText.getText(textsIndex),
      address: StraussText.getAddress(textsIndex),
      location: WayWiener.getLatLng(locationIndex),
      music: music,
    );
  }
}

List<Pair<String, String>> convertMapListToPairList(
    List<Map<String, String>> mapList) {
  return mapList
      .map((mapItem) => Pair(mapItem['image']!, mapItem['subtext']!))
      .toList();
}

// Usage:

final mapMarkers = List<MapMarkerVerfemte>.generate(
  11,
  (index) => MapMarkerVerfemte.create(
    textsIndex: index + 1,
    locationIndex: index + 1,
    imageSubtextPairs:
        convertMapListToPairList(getImageSubtextListWithFullPath(index + 1)),
    audioIndex: index + 1,
  ),
);
