import 'dart:async';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

//file import
import '../MapContent/All/waypoint_images.dart';
import '../Services/constants_mapbox.dart';
import '../Services/location_helper.dart';
import '../Style/app_style.dart';
import '../Widgets/appbar_maps.dart';
import '../Widgets/center_floatingbutton.dart';
import '../MapContent/Clara/clara_marker.dart';
import '../Services/directions_service.dart';
import '../MapContent/Clara/clara_polylines.dart';
import '../Widgets/marker_card_clara.dart';

typedef UpdateCallback = void Function(void Function());

class MapClara extends StatefulWidget {
  final String videoUrl;
  const MapClara({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<MapClara> createState() => _MapClaraState();
}

class _MapClaraState extends State<MapClara> {
  MapController _mapController = MapController();
  List<LatLng> latlngList = [];
  List<LatLng> _routePoints = [];
  LatLng? _currentLocation;
  int? _selectedMarkerIndex;
  late AudioPlayer audioPlayer;
  String? lastAudioClip;
  StreamSubscription<PlayerState>? playerStateStreamSubscription;
  late String videoUrl;

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
    List<List<double>> coordinates = await getRouteCoordinates(waypointsClara);
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

  @override
  void dispose() {
    playerStateStreamSubscription?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);

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
      floatingActionButton: CenterFloatingActionButton(
        location: const LatLng(48.210333041716, 16.372817971454),
        zoom: 14.0,
        mapController: _mapController,
      ),
      appBar: CustomAppBar(
        bgColor: const Color.fromARGB(137, 255, 255, 255),
        audioPlayer: audioPlayer,
        videoUrl: widget.videoUrl,
        title: 'Clara Wieck Schumann', //ändert titel in appbar
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
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                //"${AppConstants.mapBoxUrl}?access_token={accessToken}",
                // additionalOptions: const {
                //'id': AppConstants.id,
                // 'accessToken': AppConstants.mapBoxAccessToken,
                // },
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: _routePoints,
                    strokeWidth: 4,
                    color: Styles.polyColorClara,
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
                            WaypointImages().claraWaypoint,
                          ),
                        );
                      },
                    ),
                ],
              ),
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
}
