// location_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../Services/location_services.dart';

class LocationHelper {
  static Future<void> fetchCurrentLocation(
      MapController mapController, ValueSetter<LatLng?> setLocation) async {
    LatLng? newLocation = await getCurrentLocation(mapController);
    if (newLocation != null) {
      setLocation(newLocation);
    }
  }
}
