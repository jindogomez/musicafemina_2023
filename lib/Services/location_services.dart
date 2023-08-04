import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

Future<LatLng?> getCurrentLocation(MapController mapController) async {
  Location location = Location();
  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  LocationData locationData = await location.getLocation();
  LatLng currentPosition =
      LatLng(locationData.latitude!, locationData.longitude!);
  //mapController.move(currentPosition, 14.0); //centers beim start anhand gps

  return currentPosition;
}
