import 'package:latlong2/latlong.dart';

class WayVerfehmte {
  static final List<List<double>> waypointsVerfemte = [
    [48.19712363506885, 16.361171618116995], // Rechte Wienzeile
    [48.20709376222983, 16.349543178041923], // Strozzigasse 8
    [48.25107096967777, 16.336701132396175], // Kaasgraben 19
    [48.214704336930495, 16.353970349140837], // Alserstraße 9
    [48.21172769986605, 16.361548960941068], // Oppolzergasse 6
    [48.20772450050989, 16.37824646512905], // Wollzeile 36

    [48.204845387862306, 16.372215059644514], // Johannesgasse 4a

    [48.20175279331389, 16.361817793300766], // Rahlgasse 4
  ];

  static LatLng getLatLng(int index) {
    try {
      if (index >= 0 && index < waypointsVerfemte.length) {
        // Safe to access waypointsStrauss
        return LatLng(waypointsVerfemte[index][0], waypointsVerfemte[index][1]);
      } else {
        throw Exception('Invalid index: $index');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
