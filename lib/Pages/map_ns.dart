import 'dart:async';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/NsVerfemte/verfemte_marker.dart';
import 'package:musicafemina/MapContent/NsVerfemte/verfemte_polylines.dart';
import 'package:musicafemina/Pages/impressum.dart';
import 'package:musicafemina/Widgets/costum_icons.dart';
import 'package:musicafemina/Widgets/marker_card_ns.dart';

//file import
import '../MapContent/All/waypoint_images.dart';
import '../Services/constants_mapbox.dart';
import '../Services/location_helper.dart';
import '../Style/app_style.dart';
import '../Widgets/appbar_maps.dart';
import '../Widgets/center_floatingbutton.dart';



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

  LatLng? _currentLocation;
  int? _selectedMarkerIndex;
  late AudioPlayer audioPlayer;
  String? lastAudioClip;
  StreamSubscription<PlayerState>? playerStateStreamSubscription;
  late String videoUrl;
  final double customAppBarHeight = 100.0;
    List<LatLng> route = [];

  @override
  void initState() {
    super.initState();
    _initializeComponents();
     _fetchCompleteRoute(); 
  }

  void _initializeComponents() {
    _initializeMapController();
    setupLocationHelper();
   
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
            content: const Text('Keine Locations gefunden, vergewisere dich, dass du eine Internetverbindung hast'),
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
  void _fetchCompleteRoute() {
    if (WayVerfehmte.routeSegments.isNotEmpty) {
      List<LatLng> completeRoute = [];
      for (int i = 0; i < WayVerfehmte.routeSegments.length; i++) {
        List<LatLng> segment = WayVerfehmte.getRouteSegment(i);
        completeRoute.addAll(segment);
      }
      setState(() {
        route = completeRoute;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
          backgroundColor: Colors.black.withOpacity(0.5),
        imageFilterColor: Styles.polyColorNS.withOpacity(0.1),
        bgColor: Styles.bgColor,
        audioPlayer: audioPlayer,
        onLeadingButtonPressed: _toggleCardVisibility,
        videoUrl: widget.videoUrl,
        title: 'Ns Verfemte', //ändert titel in appbar
                  onMapUpdate: (MapController mapController) {
    _mapController.move(
            const LatLng(48.210333041716, 16.372817971454), 14.0);
  },
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
                backgroundColor: Styles.polyColorNS.withOpacity(0.1),
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
                minZoom: 12,
                maxZoom: 18,
                zoom: 14,
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
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: route,
                        strokeWidth: 6,
                        color: Styles.polyColorNS,
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

  @override
  void dispose() {
    audioPlayer.dispose();
    playerStateStreamSubscription?.cancel();
    super.dispose();
  }
}
