import 'dart:async';
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../Services/audio_button.dart';
import '../../Services/constants.dart';
import '../../Services/location_helper.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'clara_marker.dart';
import '../../app_style.dart';
import '../../Services/directions_service.dart';
import 'clara_polylines.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  MapController _mapController = MapController();
  List<LatLng> latlngList = [];
  List<LatLng> _routePoints = [];
  LatLng? _currentLocation;
  int? _selectedMarkerIndex;
  late AudioPlayer audioPlayer;
  String? lastAudioClip;
  StreamSubscription<PlayerState>? playerStateStreamSubscription;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    LocationHelper.fetchCurrentLocation(_mapController, (newLocation) {
      setState(() {
        _currentLocation = newLocation;
      });
    });
//Loads waypoints from the polylines
    getRouteCoordinates(waypointsClara).then((coordinates) {
      setState(() {
        _routePoints = coordinates
            .map((coordinate) => LatLng(coordinate[0], coordinate[1]))
            .toList();
      });
    });

    audioPlayer = AudioPlayer();

    playerStateStreamSubscription =
        audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed ||
          state.processingState == ProcessingState.idle) {
        if (mounted) {
          setState(() {
            isPlaying.value = false;
          });
        }
      } else if (state.processingState == ProcessingState.ready &&
          state.playing) {
        if (mounted) {
          setState(() {
            isPlaying.value = true;
          });
        }
      }
    });
  }

  @override

  /// Dispose audio player
  void dispose() {
    playerStateStreamSubscription?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);

  /// Play or pause audio
  void playPauseAudio(String? audioClip, UpdateCallback updateUI) async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
      updateUI(() => isPlaying.value = false);
    } else {
      if (lastAudioClip != audioClip ||
          audioPlayer.processingState == ProcessingState.completed) {
        await audioPlayer.stop();
        await audioPlayer.setAsset(audioClip!);
        lastAudioClip = audioClip;
      }
      await audioPlayer.play();
      updateUI(() => isPlaying.value = true);
    }
  }

  /// Restart audio
  Future<void> restartAudio(String? audioClip) async {
    await audioPlayer.stop();
    await audioPlayer.setAsset(audioClip!);
    await audioPlayer.play();
    isPlaying.value = true;
  }

  bool _isCardVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 246, 83, 83),
        foregroundColor: Colors.black,
        mini: false,
        onPressed: () {
          _mapController.move(const LatLng(48.210333041716, 16.372817971454),
              14.0); // Driekte Locatieon hard coded
        },
        child: const Icon(Icons.adjust_rounded),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Image.asset(
          'assets/images/mf_logo_B.png',
          fit: BoxFit.cover,
          height: 80,
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              minZoom: 14,
              maxZoom: 18,
              zoom: 15,
              center: AppConstants.myLocation,
              interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              onTap: (tapPosition, LatLng point) {
                if (_isCardVisible) {
                  setState(() {
                    _isCardVisible = false;
                    audioPlayer.stop();
                  });
                }
              },
            ),
            children: [
              TileLayer(
                /// Mapbox tile layer
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/landl0s/ckhw0f5290i2i19p8fzl92a68/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGFuZGwwcyIsImEiOiJja2h2eXY0dXI1ODgxMzVsNmd0dnQwdG4zIn0.2R2Vu1FpicdYg1ts13b8BA",
                additionalOptions: const {
                  'id': 'mapbox.mapbox-streets-v8',
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: _routePoints,
                    strokeWidth: 4,
                    color: Colors.purple,
                    isDotted: true,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  if (_currentLocation != null)
                    Marker(
                      height: 80,
                      width: 80,
                      point: _currentLocation!,
                      builder: (_) {
                        return const Icon(
                          Icons.my_location,
                          color: Color.fromARGB(255, 221, 0,
                              44), //wird nicht angezeigt.. fehler muss ich suchen
                        );
                      },
                    ),
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                      height: 60,
                      width: 60,
                      point: mapMarkers[i].location ?? AppConstants.myLocation,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCardVisible = true;
                              _selectedMarkerIndex = i;
                              audioPlayer.stop();
                            });
                          },
                          child: Image.asset(
                            'assets/images/Waypoint_Clara_01.png',
                          ),
                        );
                      },
                    ),
                ],
              ),
              Visibility(
                visible: _isCardVisible,
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    color: const Color.fromARGB(255, 215, 22, 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SizedBox(
                      height: 500,
                      child: _selectedMarkerIndex != null
                          ? Padding(
                              padding: const EdgeInsets.all(2),
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          mapMarkers[_selectedMarkerIndex!]
                                                  .backgroundImage ??
                                              ''),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 600),
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
                                              mapMarkers[_selectedMarkerIndex!]
                                                      .title ??
                                                  '',
                                              style: Styles.textStyle1,
                                            ),
                                            const SizedBox(height: 20),
                                            AudioControls(
                                              mapMarkers: mapMarkers,
                                              selectedMarkerIndex:
                                                  _selectedMarkerIndex,
                                              playPauseAudio: playPauseAudio,
                                              restartAudio: restartAudio,
                                              audioPlayer: audioPlayer,
                                              isPlaying:
                                                  isPlaying, // Add this line
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              mapMarkers[_selectedMarkerIndex!]
                                                      .text ??
                                                  '',
                                              style: Styles.textMain,
                                            ),
                                            const SizedBox(height: 15),
                                            for (Pair<String,
                                                    String> imageSubtextPair
                                                in mapMarkers[
                                                        _selectedMarkerIndex!]
                                                    .imageSubtextPairs)
                                              Column(
                                                children: [
                                                  Image.asset(
                                                      imageSubtextPair.first),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
