import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:just_audio/just_audio.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/All/waypoint_images.dart';
import 'package:musicafemina/MapContent/Demokratie/demokratie_marker.dart';
import 'package:musicafemina/MapContent/Demokratie/demokratie_polylines.dart';
import 'package:musicafemina/Pages/impressum.dart';
import 'package:musicafemina/Services/constants_mapbox.dart';
import 'package:musicafemina/Services/location_helper.dart';
import 'package:musicafemina/Style/app_style.dart';
import 'package:musicafemina/Widgets/appbar_demokratie.dart';
import 'package:musicafemina/Widgets/center_floatingbutton.dart';
import 'package:musicafemina/Widgets/costum_icons.dart';
import 'package:musicafemina/Widgets/marker_card_demokratie.dart';

typedef UpdateCallback = void Function(void Function());

class MapDemokratie extends StatefulWidget {
  final Map<String, String> videoUrls;

  const MapDemokratie({Key? key, required this.videoUrls}) : super(key: key);

  @override
  State<MapDemokratie> createState() => _MapDemokratieState();
}

class _MapDemokratieState extends State<MapDemokratie> with WidgetsBindingObserver {
  MapController _mapController = MapController();
  List<LatLng> latlngList = [];
  List<LatLng> route = [];
  LatLng? _currentLocation;
  int? _selectedMarkerIndex;
  late AudioPlayer audioPlayer;
  String? lastAudioClip;
  StreamSubscription<PlayerState>? playerStateStreamSubscription;

  final double customAppBarHeight = 100.0;

  bool _isCardVisible = false;

  final GlobalKey<MarkerCardState> _markerCardKey = GlobalKey(); // Add this line

  @override
  void initState() {
    super.initState();
    _initializeComponents();
    _fetchCompleteRoute();
    WidgetsBinding.instance.addObserver(this); // Add this line
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    playerStateStreamSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this); // Add this line
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Call initializeVideoAgain when coming back to the app
      if (_markerCardKey.currentState != null) {
        _markerCardKey.currentState!.initializeVideoAgain();
      }
    }
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
            content: const Text('Kein Gps Signal, bitte aktiviere dein GPS'),
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

  // Updated _fetchCompleteRoute method using hard-coded segments
  void _fetchCompleteRoute() {
    if (WayDemokratie.routeSegments.isNotEmpty) {
      List<LatLng> completeRoute = [];
      for (int i = 0; i < WayDemokratie.routeSegments.length; i++) {
        List<LatLng> segment = WayDemokratie.getRouteSegment(i);
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
              content: const Text(
                  'An error occurred while trying to play the audio'),
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

  Future<void> restartAudio(String? audioClip) async {
    await audioPlayer.stop();
    await audioPlayer.setAsset(audioClip!);
    await audioPlayer.play();
    isPlaying.value = true;
  }

  void _toggleCardVisibility() {
    setState(() {
      _isCardVisible = !_isCardVisible;
    });
    audioPlayer.stop();
  }

  void disposeAudio() {
    audioPlayer.stop();
    if (_markerCardKey.currentState != null) {
      _markerCardKey.currentState!.disposeVideo(); // Add this line
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        audioPlayer: audioPlayer,
        imageFilterColor: Styles.polyColorDemokratie,
        title: 'Orte der Demokratie',
        bgColor: Colors.black.withOpacity(0.5),
        onLeadingButtonPressed: () {
          Navigator.pop(context);
        },
        onMapUpdate: (MapController mapController) {
          _mapController.move(
              const LatLng(48.210333041716, 16.372817971454), 14.0);
        },
        videoUrls: widget.videoUrls,
        isCardVisible: _isCardVisible,
        toggleCardVisibility: _toggleCardVisibility,
        disposeAudio: disposeAudio, // Pass the disposeAudio function
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
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: SizedBox(width: 24, height: 24), label: ''),
              BottomNavigationBarItem(
                  icon: SizedBox(width: 24, height: 24), label: ''),
            ],
            backgroundColor: Styles.polyColorDemokratie.withOpacity(0.3),
            elevation: 0.0,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 5,
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Image.asset(
                      'assets/images/Stadt-Wien_Logo_pos_rgb.gif',
                      width: 80.0,
                      height: 80.0,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                      size: 40.0,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ImpressumPage()),
                      );
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
          Padding(
            padding: EdgeInsets.only(top: customAppBarHeight),
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                minZoom: 12,
                maxZoom: 18,
                zoom: 13,
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
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: route,
                      strokeWidth: 4,
                      color: Styles.polyColorDemokratie,
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
                          imageAsset: WaypointImages().demokratieWaypoint,
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
                  key: _markerCardKey, // Add this line
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
}
