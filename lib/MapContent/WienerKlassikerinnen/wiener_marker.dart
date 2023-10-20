import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';

import 'package:musicafemina/MapContent/WienerKlassikerinnen/wiener_pair_images.dart';


import 'package:musicafemina/MapContent/WienerKlassikerinnen/wiener_text.dart';
import 'package:musicafemina/MapContent/WienerKlassikerinnen/wiener_audio_urls.dart';
import 'package:musicafemina/MapContent/WienerKlassikerinnen/wiener_polylines.dart';

const String blankImage = 'assets/images/blank.png';

class MapMarkerWiener {
  final List<Pair<String, String>> imageSubtextPairs;
  final String backgroundImage;
  final String title;
  final String address;
  final String text;
  final LatLng location;
  final String audioClip;
  final LatLng? music;

  MapMarkerWiener._({
    required this.backgroundImage,
    required this.imageSubtextPairs,
    required this.audioClip,
    required this.title,
    required this.text,
    required this.address,
    required this.location,
    this.music,
  });

  factory MapMarkerWiener.create({
    required int textsIndex,
    required int locationIndex,
    required List<Pair<String, String>> imageSubtextPairs,
    required int audioIndex,
    LatLng? music,
  }) {
    return MapMarkerWiener._(
      backgroundImage: blankImage,
      imageSubtextPairs: imageSubtextPairs,
      audioClip: AudioPathWiener.getAudioPath(audioIndex),
      title: WienerText.getText(textsIndex),
      text: WienerText.getText(textsIndex),
      address: WienerText.getAddress(textsIndex),
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

final mapMarkers = List<MapMarkerWiener>.generate(
  12,
  (index) => MapMarkerWiener.create(
    textsIndex: index,
    locationIndex: index,
    imageSubtextPairs: convertMapListToPairList(getImageSubtextListWithFullPath(index)),
    audioIndex: index,
  ),
);
