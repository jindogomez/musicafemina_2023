import 'package:latlong2/latlong.dart';
// TODO: coordinaten einfügen

class WayStrauss {
  static final List<List<double>> waypointsStrauss = [
    [48.2082242087015, 16.3585868480227], //Heldenplatz
    [48.2071834219, 16.371258207246], // Kärntner durchgang
    [48.2053744179023, 16.375045749243], // seilerstätte 9
    [48.2027537234097, 16.370222119149], //kärntner ring 1
    [48.1955981451396, 16.368934135274], //
    [48.1955981251396, 16.3689341352274], // Favoritenstraße 8Favoritenstraße 8
  ];

  static LatLng getLatLng(int index) {
    return LatLng(
        waypointsStrauss[index - 1][0], waypointsStrauss[index - 1][1]);
  }
}
// -1 ist das index bei 1 startet nicht bei 0
