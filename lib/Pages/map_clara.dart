import 'dart:async';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/Pages/impressum.dart';

//file import
import '../MapContent/All/waypoint_images.dart';
import '../Services/constants_mapbox.dart';
import '../Services/location_helper.dart';
import '../Style/app_style.dart';
import '../Widgets/appbar_maps.dart';
import '../Widgets/center_floatingbutton.dart';
import '../MapContent/Clara/clara_marker.dart';

import '../MapContent/Clara/clara_polylines.dart';
import '../Widgets/marker_card_clara.dart';
import 'menu.dart';

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
  List<LatLng> route  = [];
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
    initializeMapController();
    setupLocationHelper();
   _fetchCompleteRoute();
    setupAudioPlayer();
  }

  void initializeMapController() {
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
            content: const Text('Kein Gps Signal, vergewisere dich, dass du dein GPS aktiviert hast.'),
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
  void _fetchCompleteRoute() {
  if (WayClara.routeSegments.isNotEmpty) {
    List<LatLng> completeRoute = [];
    for (int i = 0; i < WayClara.routeSegments.length; i++) {
      List<LatLng> segment = WayClara.getRouteSegment(i);
      completeRoute.addAll(segment);
    }
    setState(() {
      route = completeRoute;
    });
  }
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

  void _toggleCardVisibility() {
    if (_isCardVisible) {
      setState(() {
        _isCardVisible = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Menu(
                  paramHomepage: 'home',
                )), // Your menu page class
      );
    }

    audioPlayer.stop();
    _mapController.move(const LatLng(48.210333041716, 16.372817971454),
        14.0); // Centering the map
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      floatingActionButton: !_isCardVisible
          ? CenterFloatingActionButton(
              location: const LatLng(48.210333041716, 16.372817971454),
              zoom: 14.0,
              mapController: _mapController,
              onPressed: () {},
            )
          : null,
      appBar: CustomAppBar(
          backgroundColor: Colors.black.withOpacity(0.5),
        imageFilterColor: Styles.polyColorClara.withOpacity(0.1),
        bgColor: const Color.fromARGB(137, 255, 255, 255),
        audioPlayer: audioPlayer,
        videoUrl: widget.videoUrl,
        onLeadingButtonPressed: _toggleCardVisibility,
        title: 'Clara Wieck Schumann', //ändert titel in appbar
                  onMapUpdate: (MapController mapController) {
    _mapController.move(
            const LatLng(48.210333041716, 16.372817971454), 14.0);
  },
      ),
         bottomNavigationBar: Stack(
            children: [
              // workaround für transparente ynavbar
              BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: SizedBox(width: 24, height: 24), label: ''),
                  BottomNavigationBarItem(
                      icon: SizedBox(width: 24, height: 24), label: ''),
                ],
                backgroundColor: Styles.polyColorClara.withOpacity(0.1),
                elevation: 0.0, // schatten unter navbar
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 5,
                child: SizedBox(
                  height: 50, // höhe navbar bottum
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        // logo wien
                        child: Image.asset(
                          'assets/images/Stadt-Wien_Logo_pos_rgb.gif',
                          width: 80.0,
                          height: 80.0,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.info_outlined,
                          size: 40.0,
                          color: Color.fromARGB(255, 171, 0, 0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ImpressumPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
     body: Stack(
  children: [
    Container(
      color: Colors.white, // Sets a white background for the stack
    ),
    Opacity(
      opacity: 0.8, 
      child: Padding(
            padding: EdgeInsets.only(top: customAppBarHeight),
            child: FlutterMap(
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
    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
           subdomains: const ['a', 'b', 'c'],
           

                  //"${AppConstants.mapBoxUrl}?access_token={accessToken}",
                  // additionalOptions: const {
                  //'id': AppConstants.id,
                  // 'accessToken': AppConstants.mapBoxAccessToken,
                  // },
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: route,
                      strokeWidth: 6,
                      color: Styles.polyColorClara,
                      isDotted: false,
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
                        point:
                            mapMarkers[i].location ?? AppConstants.myLocation,
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
          ),
    ),
        ],
      ),
    );
  }
}
