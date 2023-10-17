import 'package:latlong2/latlong.dart';

class WayStrauss {
  static final List<List<double>> waypointsStrauss = [
    [48.205768299109664, 16.376696949057813], // 1010, Palais Coburg
    [48.20808069343108, 16.370632991307364], //1010 Wien. Spiegelgasse 1
    [48.2006546342065, 16.372364152777823], // 1010, Musikverein Karlsplatz
    [48.20027936976553, 16.34487439307539], // 1070, Zieglergasse 25
    [48.1988690214902, 16.36804809493463], // 1040, Wiedner Hauptstraße 7

    [48.19897726037587, 16.394640376143403], // 1030, Landstraßer Hauptstraße 97

    [48.21558627415207, 16.400195363856138], // Prater
    [
      48.26683619036202, 16.365221889682317], // 1190, Nussdorf Donau Schifffahrt Anlegestelle
  ];
  static LatLng getLatLng(int index) {
    try {
      if (index >= 0 && index < waypointsStrauss.length) {
        // Safe to access waypointsStrauss
        return LatLng(waypointsStrauss[index][0], waypointsStrauss[index][1]);
      } else {
     
        throw Exception(
            'Invalid index: $index'); // You can decide to throw an exception or return a default value
      }
    } catch (e) {

      throw Exception(
          'An error occurred: $e'); // You can also choose to return a default LatLng value here
    }
  }
}
