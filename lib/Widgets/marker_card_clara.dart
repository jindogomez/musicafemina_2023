// marker_card.dart
//design  für die card
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'audio_button_clara.dart';
import '../Style/app_style.dart';
import '../MapContent/Clara/clara_marker.dart';

class MarkerCard extends StatelessWidget {
  final bool _isCardVisible;
  final int? _selectedMarkerIndex;
  final AudioPlayer audioPlayer;
  final ValueNotifier<bool> isPlaying;
  final void Function(String? audioClip, UpdateCallback updateUI)
      playPauseAudio;
  final Future<void> Function(String? audioClip) restartAudio;

  const MarkerCard(this._isCardVisible, this._selectedMarkerIndex,
      this.audioPlayer, this.isPlaying, this.playPauseAudio, this.restartAudio,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isCardVisible,
      child: Align(
        alignment: Alignment.center,
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: 600,
            child: _selectedMarkerIndex != null
                ? Padding(
                    padding: const EdgeInsets.all(2),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(mapMarkers[_selectedMarkerIndex!]
                                    .backgroundImage ??
                                ''),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 600),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Text(
                                      mapMarkers[_selectedMarkerIndex!]
                                              .address ??
                                          '',
                                      style: Styles.headline),
                                  const SizedBox(height: 2),
                                  Text(
                                    mapMarkers[_selectedMarkerIndex!].title ??
                                        '',
                                    style: Styles.textStyle1,
                                  ),
                                  const SizedBox(height: 20),
                                  AudioControls(
                                    mapMarkers: mapMarkers,
                                    selectedMarkerIndex: _selectedMarkerIndex,
                                    playPauseAudio: playPauseAudio,
                                    restartAudio: restartAudio,
                                    audioPlayer: audioPlayer,
                                    isPlaying: isPlaying, // Add this line
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    mapMarkers[_selectedMarkerIndex!].text ??
                                        '',
                                    style: Styles.textMain,
                                  ),
                                  const SizedBox(height: 15),
                                  for (Pair<String, String> imageSubtextPair
                                      in mapMarkers[_selectedMarkerIndex!]
                                          .imageSubtextPairs)
                                    Column(
                                      children: [
                                        Image.asset(imageSubtextPair.first),
                                        Text(
                                          imageSubtextPair.last,
                                          style: Styles.textMain,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
