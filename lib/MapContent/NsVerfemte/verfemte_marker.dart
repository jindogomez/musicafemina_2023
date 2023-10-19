import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/NsVerfemte/verfemte_audio_urls.dart';
import 'package:musicafemina/MapContent/NsVerfemte/verfemte_pair_images.dart';
import 'package:musicafemina/MapContent/NsVerfemte/verfemte_polylines.dart';
import 'package:musicafemina/MapContent/NsVerfemte/verfemte_text.dart';


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
      audioClip: AudioPathVerfemte.getAudioPath(audioIndex),
      title: VerfemteText.getTitle(textsIndex),
      text: VerfemteText.getText(textsIndex),
      address: VerfemteText.getAddress(textsIndex),
      location: WayVerfehmte.getLatLng(locationIndex),
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
  8,
  (index) => MapMarkerVerfemte.create(
    textsIndex: index,
    locationIndex: index,
    imageSubtextPairs: convertMapListToPairList(getImageSubtextListWithFullPath(index)),
    audioIndex: index,
  ),
);
