import 'dart:async';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/NsVerfemte/verfemte_marker.dart';
import 'package:musicafemina/MapContent/NsVerfemte/verfemte_polylines.dart';
import 'package:musicafemina/Widgets/costum_icons.dart';
import 'package:musicafemina/Widgets/marker_card_ns.dart';

//file import
import '../MapContent/All/waypoint_images.dart';
import '../Services/constants_mapbox.dart';
import '../Services/location_helper.dart';
import '../Style/app_style.dart';
import '../Widgets/appbar_maps.dart';
import '../Widgets/center_floatingbutton.dart';

import '../Services/directions_service.dart';

import 'menu.dart';

typedef UpdateCallback = void Function(void Function());

class MapNs extends StatefulWidget {
  final String videoUrl;
  const MapNs({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<MapNs> createState() => _MapStraussState();
}

class _MapStraussState extends State<MapNs> {
  MapController _mapController = MapController();
  List<LatLng> latlngList = [];
  List<LatLng> _routePoints = [];
  LatLng? _currentLocation;
  int? _selectedMarkerIndex;
  late AudioPlayer audioPlayer;
  String? lastAudioClip;
  StreamSubscription<PlayerState>? playerStateStreamSubscription;
  late String videoUrl;
  final double customAppBarHeight = 100.0;

  @override
  void initState() {
    super.initState();
    _initializeComponents();
  }

  void _initializeComponents() {
    _initializeMapController();
    setupLocationHelper();
    loadRouteCoordinates();
    setupAudioPlayer();
  }

  void _initializeMapController() {
    _mapController = MapController();
  }

  void setupLocationHelper() {
    LocationHelper.fetchCurrentLocation(_mapController, (newLocation) {
      if (mounted) {
        setState(() {
          _currentLocation = newLocation;
        });
      }
    }).catchError((e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Error fetching location: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  Future<void> loadRouteCoordinates() async {
    try {
      List<List<double>> coordinates =
          await getRouteCoordinates(WayVerfehmte.waypointsVerfemte);

      if (coordinates.isNotEmpty) {
        if (mounted) {
          setState(() {
            _routePoints = coordinates
                .map((coordinate) => LatLng(coordinate[0], coordinate[1]))
                .toList();
          });
        }
      } else {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text('No Coordinates found'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('No Coordinates found: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  void setupAudioPlayer() {
    audioPlayer = AudioPlayer();
    playerStateStreamSubscription =
        audioPlayer.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          if (state.processingState == ProcessingState.completed ||
              state.processingState == ProcessingState.idle) {
            isPlaying.value = false;
          } else if (state.processingState == ProcessingState.ready &&
              state.playing) {
            isPlaying.value = true;
          }
        });
      }
    });
  }

  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);

  /// Play or pause audio
  void playPauseAudio(String? audioClip, UpdateCallback updateUI) async {
    if (audioClip == null) {
      throw ArgumentError('Audio clip cannot be found');
    }

    try {
      if (audioPlayer.playing) {
        await audioPlayer.pause();
        if (mounted) {
          updateUI(() => isPlaying.value = false);
        }
      } else {
        if (lastAudioClip != audioClip ||
            audioPlayer.processingState == ProcessingState.completed) {
          await audioPlayer.stop();
          await audioPlayer.setAsset(audioClip);
          lastAudioClip = audioClip;
        }
        await audioPlayer.play();
        if (mounted) {
          updateUI(() => isPlaying.value = true);
        }
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content:
                  Text('An error occurred while trying to play the audio: $e'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
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

  void _toggleCardVisibility() async {
    await audioPlayer.stop();
    await audioPlayer.seek(Duration.zero);
    setState(() {
      if (_isCardVisible) {
        _isCardVisible = false;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Menu(paramHomepage: 'home'),
          ),
        );
        _mapController.move(
            const LatLng(48.210333041716, 16.372817971454), 14.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        bgColor: Styles.bgColor,
        audioPlayer: audioPlayer,
        onLeadingButtonPressed: _toggleCardVisibility,
        videoUrl: widget.videoUrl,
        title: 'Ns Verfemte', //ändert titel in appbar
      ),
      floatingActionButton: _isCardVisible
          ? null
          : CenterFloatingActionButton(
              location: const LatLng(48.210333041716, 16.372817971454),
              zoom: 14.0,
              mapController: _mapController,
              onPressed: () {
                setState(() {
                  _isCardVisible = true;
                });
              },
            ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: customAppBarHeight),
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                minZoom: 12,
                maxZoom: 18,
                zoom: 12,
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
                        builder: (_) => Icon(
                          Icons.my_location,
                          color: Styles.primaryColor,
                        ),
                      ),
                    for (int i = 0; i < mapMarkers.length; i++)
                      Marker(
                        height: 60,
                        width: 60,
                        point: mapMarkers[i].location,
                        builder: (_) => CustomIcon(
                          location: mapMarkers[i].location,
                          imageAsset: WaypointImages().nsWaypoint,
                          onTap: () {
                            setState(() {
                              _isCardVisible = true;
                              _selectedMarkerIndex = i;
                              audioPlayer.stop();
                              audioPlayer.seek(Duration.zero);
                            });
                          },
                        ),
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
          ),
        ],
      ),
    );
  }

  //close AudioPlayer and StreamSubscription when leaving the page
  @override
  void dispose() {
    // Cancel your stream subscription or any other ongoing operation here
    audioPlayer.dispose();
    playerStateStreamSubscription?.cancel();
    super.dispose();
  }
}