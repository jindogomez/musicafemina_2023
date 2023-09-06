import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class CenterFloatingActionButton extends StatelessWidget {
  final LatLng location;
  final double zoom;
  final MapController _mapController;
  final IconData iconData;
  final Color backgroundColor, foregroundColor;
  final bool mini;

  const CenterFloatingActionButton({
    super.key,
    required this.location,
    required this.zoom,
    required MapController mapController,
    this.iconData = Icons.gps_fixed,
    this.foregroundColor = const Color.fromARGB(255, 171, 0, 0),
    this.backgroundColor = const Color.fromARGB(137, 255, 255, 255),
    this.mini = false,
  }) : _mapController = mapController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      mini: mini,
      onPressed: () {
        _mapController.move(location, zoom);
      },
      child: Icon(iconData),
    );
  }
}
