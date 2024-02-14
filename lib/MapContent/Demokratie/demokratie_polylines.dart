import 'package:latlong2/latlong.dart';

class WayDemokratie {
  static final List<List<double>> waypointsDemokratie = [
    [48.22120561042527, 16.35964193421379],   //1090 Wien, Strudlhofstiege / Liechtensteinstrasse 51
    [48.235175513148526, 16.348223436012745], // 1190 Wien, Gymnasiumstraße 79
    [48.2098915123575, 16.36617614007206],    // 1010 Wien, Wallner Straße 9
    [48.210463651103844, 16.37006667895808],  //1010 Wien, Graben Tuchlauben 11 / Trattnerhof 
    [48.20815339481049, 16.359193625541174],  // 1010 Wien, Dr. Karl Renner-Ring 1
    [48.206766245902024, 16.359805117949467], // 1030 Wien, Lothringerstrasse 20 
    [48.2006207657804, 16.370454507477337],   // 1010 Wien, Karlsplatz 
    [48.211713384562835, 16.36158114791012],   // 1010 Wien, Oppolzergasse 6
  ];


  static LatLng getLatLng(int index) {
    try {
      if (index >= 0 && index < waypointsDemokratie.length) {
     
        return LatLng(waypointsDemokratie[index][0], waypointsDemokratie[index][1]);
      } else {
     
        throw Exception(
            'Lese Fehler: $index'); 
      }
    } catch (e) {

      throw Exception(
          'Fehler: $e'); 
    }
  }
}
