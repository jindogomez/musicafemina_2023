// Script zum Abrufen der Routen von OpenRouteService und Ausgabe der Koordinaten für die Hardcodierung in der Flutter-App!!
//nur zum gnerieren der Routen, nicht für die App selbst
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class WayDemokratieRouteFetcher {
  static const String apiKey = '5b3ce3597851110001cf6248fc56fdd85d304f7cb293aa07dd8d0e87';
  static const String baseUrl = 'https://api.openrouteservice.org/v2/directions/foot-walking';

  static final List<LatLng> waypoints = [
const LatLng(48.183981531980834,16.40326972223622), //St. Marxer Friedhof Nanette Streicher
    const LatLng(48.205768299109664, 16.376696949057813),
    const LatLng(48.20808069343108, 16.370632991307364),
    const LatLng(48.2006546342065, 16.372364152777823),
    const LatLng(48.20027936976553, 16.34487439307539),
    const LatLng(48.1988690214902, 16.36804809493463),
    const LatLng(48.19897726037587, 16.394640376143403),
    const LatLng(48.21558627415207, 16.400195363856138),
    const LatLng(48.26683619036202, 16.365221889682317),
  ];

  static Future<List<LatLng>> fetchRouteSegment(LatLng start, LatLng end) async {
    final url = '$baseUrl?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List coordinates = data['features'][0]['geometry']['coordinates'];
      return coordinates.map<LatLng>((coord) => LatLng(coord[1], coord[0])).toList();
    } else {
      throw Exception('Failed to load route segment');
    }
  }

  static Future<List<List<LatLng>>> fetchAllRouteSegments() async {
    List<List<LatLng>> allSegments = [];
    for (int i = 0; i < waypoints.length - 1; i++) {
      if (kDebugMode) {
        print('Fetching segment ${i + 1} of ${waypoints.length - 1}');
      }
      List<LatLng> segment = await fetchRouteSegment(waypoints[i], waypoints[i + 1]);
      allSegments.add(segment);
    }
    return allSegments;
  }

  static void printRoutesForHardcoding(List<List<LatLng>> allSegments) {
    if (kDebugMode) {
      print('static final List<List<LatLng>> routeSegments = [');
    }
    for (var segment in allSegments) {
      if (kDebugMode) {
        print('  [');
      }
      for (var point in segment) {
        if (kDebugMode) {
          print('    LatLng(${point.latitude}, ${point.longitude}),');
        }
      }
      if (kDebugMode) {
        print('  ],');
      }
    }
    if (kDebugMode) {
      print('];');
    }
  }
}

void main() async {
  try {
    List<List<LatLng>> allSegments = await WayDemokratieRouteFetcher.fetchAllRouteSegments();
    WayDemokratieRouteFetcher.printRoutesForHardcoding(allSegments);
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}