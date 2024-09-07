import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/Strauss/strauss_audio_urls.dart';
import 'package:musicafemina/MapContent/Strauss/strauss_pair_images.dart';
import 'package:musicafemina/MapContent/Strauss/strauss_polylines.dart';
import 'package:musicafemina/MapContent/Strauss/strauss_text.dart';

const String blankImage = 'assets/images/blank.png';

class MapMarkerStrauss {
  final List<Pair<String, String>> imageSubtextPairs;
  final String backgroundImage;
  final String title;
  final String address;
  final String text;
  final LatLng location;
  final String audioClip;
  final LatLng? music;
  final int videoIndex; // Ensure this is non-nullable

  MapMarkerStrauss._({
    required this.backgroundImage,
    required this.imageSubtextPairs,
    required this.audioClip,
    required this.title,
    required this.text,
    required this.address,
    required this.location,
    required this.videoIndex,
    this.music,
  });

  factory MapMarkerStrauss.create({
    required int textsIndex,
    required int locationIndex,
    required List<Pair<String, String>> imageSubtextPairs,
    required int audioIndex,
    required int videoIndex,
    LatLng? music,
  }) {
    return MapMarkerStrauss._(
      backgroundImage: blankImage,
      imageSubtextPairs: imageSubtextPairs,
      audioClip: AudioPathStrauss.getAudioPath(audioIndex),
      title: StraussText.getTitle(textsIndex),
      text: StraussText.getText(textsIndex),
      address: StraussText.getAddress(textsIndex),
      location: WayStrauss.getLatLng(locationIndex),
      music: music,
      videoIndex: videoIndex,
    );
  }
}

// Define the convertMapListToPairList method
List<Pair<String, String>> convertMapListToPairList(
    List<Map<String, String>> mapList) {
  return mapList
      .map((mapItem) => Pair(mapItem['image']!, mapItem['subtext']!))
      .toList();
}

// Usage:
final mapMarkers = List<MapMarkerStrauss>.generate(
  8,
  (index) => MapMarkerStrauss.create(
    textsIndex: index,
    locationIndex: index,
    imageSubtextPairs: convertMapListToPairList(getImageSubtextListWithFullPath(index)),
    audioIndex: index,
    videoIndex: index,
  ),
  
);