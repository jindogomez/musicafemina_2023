import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/Baker/baker_pair_images.dart';

import 'baker_text.dart';

import 'baker_audio_urls.dart';
import 'baker_polylines.dart';

const String blankImage = 'assets/images/blank.png';

class MapMarkerBaker {
  final List<Pair<String, String>> imageSubtextPairs;
  final String backgroundImage;
  final String title;
  final String address;
  final String text;
  final LatLng location;
  final String audioClip;
  final LatLng? music;

  MapMarkerBaker._({
    required this.backgroundImage,
    required this.imageSubtextPairs,
    required this.audioClip,
    required this.title,
    required this.text,
    required this.address,
    required this.location,
    this.music,
  });

  factory MapMarkerBaker.create({
    required int textsIndex,
    required int locationIndex,
    required List<Pair<String, String>> imageSubtextPairs,
    required int audioIndex,
    LatLng? music,
  }) {
    return MapMarkerBaker._(
      backgroundImage: blankImage,
      imageSubtextPairs: imageSubtextPairs,
      audioClip: AudioPathBaker.getAudioPath(audioIndex),
      title: BakerText.getTitle(textsIndex),
      text: BakerText.getText(textsIndex),
      address: BakerText.getAddress(textsIndex),
      location: WayBaker.getLatLng(locationIndex),
      music: music,
    );
  }
}

final mapMarkers = List<MapMarkerBaker>.generate(
  5,
  (index) => MapMarkerBaker.create(
    textsIndex: index + 1,
    locationIndex: index + 1,
    imageSubtextPairs:
        createImageSubtextPairs(getImageSubtextListBaker(index + 1)),
    audioIndex: index + 1,
  ),
);
