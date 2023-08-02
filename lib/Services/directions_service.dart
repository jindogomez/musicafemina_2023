import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<List<double>>> getRouteCoordinates(
    List<List<double>> waypoints) async {
  const String appId = 'PLVF7LrFTDiPX0Z1CbC9';
  const String appCode = 'g395KW8_iXwtNXoez-VjwQ';

  String waypointsStr = "";
  for (int i = 0; i < waypoints.length; i++) {
    waypointsStr += "waypoint$i=geo!${waypoints[i][0]},${waypoints[i][1]}&";
  }

  final response = await http.get(
    Uri.parse(
      'https://route.api.here.com/routing/7.2/calculateroute.json?${waypointsStr}mode=fastest;pedestrian&app_id=$appId&app_code=$appCode',
    ),
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final List<List<double>> pathCoordinates = [];

    final legs = jsonResponse['response']['route'][0]['leg'];

    for (final leg in legs) {
      for (final point in leg['maneuver']) {
        try {
          final List<double> waypoint = [];
          waypoint.add(point['position']['latitude'].toDouble());
          waypoint.add(point['position']['longitude'].toDouble());
          pathCoordinates.add(waypoint);
        } catch (e) {
          // Handle the exception here or print debug information
        }
      }
    }

    return pathCoordinates;
  } else {
    throw Exception('Failed to load route');
  }
}
