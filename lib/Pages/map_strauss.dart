import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:just_audio/just_audio.dart';
import 'package:latlong2/latlong.dart';
import 'package:musicafemina/MapContent/All/video_urls.dart';
import 'package:musicafemina/Pages/impressum.dart';
import 'package:musicafemina/Services/constants_mapbox.dart';
import 'package:musicafemina/Widgets/appbar_maps_multipl_videos_strauss.dart';
import 'package:musicafemina/Widgets/costum_icons.dart';
import 'package:musicafemina/Widgets/marker_card_strauss.dart';
import '../MapContent/All/waypoint_images.dart';
import '../Services/location_helper.dart';
import '../Style/app_style.dart';
import '../Widgets/center_floatingbutton.dart';
import '../MapContent/Strauss/strauss_marker.dart';
import '../MapContent/Strauss/strauss_polylines.dart';
import 'menu.dart';

typedef UpdateCallback = void Function(void Function());

class MapStrauss extends StatefulWidget {
  const MapStrauss({Key? key}) : super(key: key);

  @override
  State<MapStrauss> createState() => _MapStraussState();
}

class _MapStraussState extends State<MapStrauss> with WidgetsBindingObserver {
  MapController _mapController = MapController();
  LatLng? _currentLocation;
  int? _selectedMarkerIndex;
  late AudioPlayer audioPlayer;
  String? lastAudioClip;
  StreamSubscription<PlayerState>? playerStateStreamSubscription;
  final double customAppBarHeight = 100.0;
  List<LatLng> route = [];

  bool _isCardVisible = false;

  final GlobalKey<MarkerCardState> _markerCardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initializeComponents();
    _fetchCompleteRoute(); 
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    playerStateStreamSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
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
            content: const Text('Kein GPS-Signal, bitte aktiviere dein GPS'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
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
    playerStateStreamSubscription = audioPlayer.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          if (state.processingState == ProcessingState.completed || state.processingState == ProcessingState.idle) {
            isPlaying.value = false;
          } else if (state.processingState == ProcessingState.ready && state.playing) {
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
        if (lastAudioClip != audioClip || audioPlayer.processingState == ProcessingState.completed) {
          await audioPlayer.stop();
          await audioPlayer.setAsset(audioClip);
        }
        await audioPlayer.play();
        if (mounted) {
          updateUI(() => isPlaying.value = true);
        }
      }
      lastAudioClip = audioClip;
    } catch (e) {
      
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Ein Fehler ist aufgetreten: ${e.toString()}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
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

  void _handleBackButtonPressed() {
    if (_isCardVisible) {
      setState(() {
        _isCardVisible = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Menu(paramHomepage: 'home'),
        ),
      );
    }
  }

  void disposeAudio() {
    audioPlayer.stop();
    if (_markerCardKey.currentState != null) {
      _markerCardKey.currentState!.disposeVideo();
    }
  }

  void _fetchCompleteRoute() {
    if (WayStrauss.routeSegments.isNotEmpty) {
      List<LatLng> completeRoute = [];
      for (int i = 0; i < WayStrauss.routeSegments.length; i++) {
        List<LatLng> segment = WayStrauss.getRouteSegment(i);
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
        bgColor: Styles.bgColor,
        audioPlayer: audioPlayer,
        onLeadingButtonPressed: _handleBackButtonPressed,
        imageFilterColor: Styles.polyColorStrauss.withOpacity(0.1),
        title: 'Strauss Zeitgenossinnen',
        onMapUpdate: (MapController mapController) {
          _mapController.move(const LatLng(48.210333041716, 16.372817971454), 14.0);
        },
        videoUrls: VideoUrls().namedStraussUrls,
        isCardVisible: _isCardVisible,
        toggleCardVisibility: () {
          setState(() {
            _isCardVisible = !_isCardVisible;
          });
        },
        disposeAudio: disposeAudio, 
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
              BottomNavigationBarItem(icon: SizedBox(width: 24, height: 24), label: ''),
              BottomNavigationBarItem(icon: SizedBox(width: 24, height: 24), label: ''),
            ],
            backgroundColor: Styles.polyColorStrauss.withOpacity(0.1),
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
                      Icons.info_outlined,
                      size: 40.0,
                      color: Color.fromARGB(255, 171, 0, 0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ImpressumPage()),
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
          Container(
            color: Colors.white,
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
                  zoom: 13,
                  center: route.isNotEmpty ? route.first : AppConstants.myLocation,
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
                        color: Styles.polyColorStrauss,
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
                            imageAsset: WaypointImages().straussWaypoint,
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
                    key: _markerCardKey,
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
