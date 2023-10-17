import 'package:latlong2/latlong.dart';
// TODO: ferteig aber 12 orte? 11 audios?
class WayWiener {
  static final List<List<double>> waypointsWiener = [
    [48.183981531980834, 16.40326972223622], //St. Marxer Friedhof Nanette Streicher 
    [48.203369121384675, 16.39152557688378], // Rasumovskygasse 29 Franz Anton Mesmer
    [48.20806385911976, 16.378344708527347], //  Postgasse/bächerstraße Josepha Auernhammer 
    [48.2099825023509, 16.37607962688728], // St. Michael Marianna von Martines
    [48.21202459843818, 16.37540697688557], //Rabensteig 8 Maria Theresia Paradis
   [48.21370769261443, 16.36506102778664], // Helferstorferstraße Josepha Müllner 
    [48.21189092202002, 16.349602926197317], // Florianigasse/ Kochgasse Leopoldine Blahetka 
    [48.20791960983279, 16.367276919731427], // Kohlmarkt/ Michealahaus Marianna von Martines
    [48.20548661795838, 16.36811170760451], // Augustiner Kirche Maria Theresia Paradis
    [48.20564741513999, 16.372213405775707], // Himmelpfortgasse 6 Josepha Auernhammer 
    [48.20058377914882, 16.370185147134077], // Karlsplatz Musikfrunde Haus Nanette Streicher 
    [48.19972353106986, 16.386680876887706] // Ungargasse 46 Nanette Streicher
  ];

  static LatLng getLatLng(int index) {
    return LatLng(
        waypointsWiener[index - 1][0], waypointsWiener[index - 1][1]);
  }
}
// -1 ist das index bei 1 startet nicht bei 0
