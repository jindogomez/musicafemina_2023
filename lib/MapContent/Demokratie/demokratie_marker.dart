import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/Demokratie/Demokratie_audio_urls.dart';
import 'package:musicafemina/MapContent/Demokratie/demokratie_pair_images.dart';
import 'package:musicafemina/MapContent/Demokratie/demokratie_polylines.dart';
import 'package:musicafemina/MapContent/Demokratie/demokratie_text.dart';

const String blankImage = 'assets/images/blank.png';

class MapMarkerDemokratie {
  final List<Pair<String, String>> imageSubtextPairs;
  final String backgroundImage;
  final String title;
  final String address;
  final String text;
  final LatLng location;
  final String audioClip;
  final LatLng? music;
  final int videoIndex;

  MapMarkerDemokratie._({
    required this.backgroundImage,
    required this.imageSubtextPairs,
    required this.audioClip,
    required this.title,
    required this.text,
    required this.address,
    required this.location,
    this.music,
    required this.videoIndex,
  });

  factory MapMarkerDemokratie.create({
    required int textsIndex,
    required int locationIndex,
    required List<Pair<String, String>> imageSubtextPairs,
    required int audioIndex,
    LatLng? music,
    required int videoIndex,
  }) {
    return MapMarkerDemokratie._(
      backgroundImage: blankImage,
      imageSubtextPairs: imageSubtextPairs,
      audioClip: AudioPathDemokratie.getAudioPath(audioIndex),
      title: DemokratieText.getTitle(textsIndex),
      text: DemokratieText.getText(textsIndex),
      address: DemokratieText.getAddress(textsIndex),
      location: WayDemokratie.getLatLng(locationIndex),
      music: music,
      videoIndex: videoIndex,
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
final mapMarkers = List<MapMarkerDemokratie>.generate(
  8,
  (index) => MapMarkerDemokratie.create(
    textsIndex: index,
    locationIndex: index,
    imageSubtextPairs: convertMapListToPairList(getImageSubtextListWithFullPath(index)),
    audioIndex: index,
    videoIndex: index,
  ),
  
);