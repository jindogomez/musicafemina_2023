import 'dart:async';

import 'package:flutter_map/plugin_api.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/Style/app_style.dart';
//file import
import '../MapContent/All/waypoint_images.dart';
import '../MapContent/Baker/baker_polylines.dart';
import '../Services/constants_mapbox.dart';
import '../Services/location_helper.dart';

import '../Widgets/appbar_maps.dart';
import '../Widgets/center_floatingbutton.dart';
import '../MapContent/Baker/baker_marker.dart';
import '../Services/directions_service.dart';

import '../Widgets/marker_card_baker.dart';

typedef UpdateCallback = void Function(void Function());

class MapBaker extends StatefulWidget {
  final String videoUrl;

  const MapBaker({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<MapBaker> createState() => _MapBakerState();
}

class _MapBakerState extends State<MapBaker> {
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
    initializeMapController();
    setupLocationHelper();
    loadRouteCoordinates();
    setupAudioPlayer();
  }

  void initializeMapController() {
    _mapController = MapController();
  }

  void setupLocationHelper() {
    LocationHelper.fetchCurrentLocation(_mapController, (newLocation) {
      setState(() {
        _currentLocation = newLocation;
      });
    });
  }

  Future<void> loadRouteCoordinates() async {
    List<List<double>> coordinates = await getRouteCoordinates(waypointsBaker);
    setState(() {
      _routePoints = coordinates
          .map((coordinate) => LatLng(coordinate[0], coordinate[1]))
          .toList();
    });
  }

  void setupAudioPlayer() {
    audioPlayer = AudioPlayer();
    playerStateStreamSubscription =
        audioPlayer.playerStateStream.listen((state) {
      if (mounted) {
        if (state.processingState == ProcessingState.completed ||
            state.processingState == ProcessingState.idle) {
          setState(() {
            isPlaying.value = false;
          });
        } else if (state.processingState == ProcessingState.ready &&
            state.playing) {
          setState(() {
            isPlaying.value = true;
          });
        }
      }
    });
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
      appBar: CustomAppBar(
        bgColor: const Color.fromARGB(115, 240, 138, 91),
        audioPlayer: audioPlayer,
        videoUrl: widget.videoUrl,
        title: 'Josephine Baker', //ändert titel in appbar
      ),
      floatingActionButton: CenterFloatingActionButton(
        location: const LatLng(48.210333041716, 16.372817971454),
        zoom: 14.0,
        mapController: _mapController,
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
                /// Mapbox tile layer Stored in constants_mapbox.dart
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: _routePoints,
                    strokeWidth: 4,
                    color: Styles.polyColorBaker,
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
                            WaypointImages().bakerWaypoint,
                          ),
                        );
                      },
                    ),
                ],
              ),
              //Design von den Karten stored in marker_card_baker.dart
              MarkerCard(
                _isCardVisible,
                _selectedMarkerIndex,
                audioPlayer,
                isPlaying,
                playPauseAudio,
                restartAudio,
              ),
            ],
          ),
        ],
      ),
    );
  }

  //close AudioPlayer and StreamSubscription when leaving the page
  @override
  void dispose() {
    playerStateStreamSubscription?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }
}
