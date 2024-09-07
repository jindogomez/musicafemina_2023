import 'package:latlong2/latlong.dart';

class WayBaker {
  // Fixed route waypoints
  static final List<LatLng> routeCoordinates = [
    const LatLng(48.2082242087015, 16.3585868480227), // Heldenplatz
    const LatLng(48.2071834219, 16.371258207246),     // Kärntner durchgang
    const LatLng(48.2053744179023, 16.375045749243),  // Seilerstätte 9
    const LatLng(48.2027537234097, 16.370222119149),  // Kärntner Ring 1
    const LatLng(48.1955981451396, 16.368934135274),  // Favoritenstraße 8
  ];


  static final List<List<LatLng>> routeSegments = [
  
 

  [
    const LatLng(48.208128, 16.359318),
    const LatLng(48.208234, 16.359349),
    const LatLng(48.208292, 16.359394),
    const LatLng(48.208322, 16.359465),
    const LatLng(48.208335, 16.359629),
    const LatLng(48.208323, 16.359771),
    const LatLng(48.208493, 16.359814),
    const LatLng(48.208458, 16.360074),
    const LatLng(48.208446, 16.360164),
    const LatLng(48.208437, 16.360228),
    const LatLng(48.208426, 16.360309),
    const LatLng(48.208574, 16.360354),
    const LatLng(48.208565, 16.360447),
    const LatLng(48.208557, 16.360576),
    const LatLng(48.208529, 16.360753),
    const LatLng(48.20804, 16.360614),
    const LatLng(48.207993, 16.36104),
    const LatLng(48.20797, 16.361217),
    const LatLng(48.207922, 16.361323),
    const LatLng(48.207958, 16.361694),
    const LatLng(48.20797, 16.361815),
    const LatLng(48.207981, 16.361917),
    const LatLng(48.208034, 16.362414),
    const LatLng(48.208063, 16.362686),
    const LatLng(48.208076, 16.36273),
    const LatLng(48.208072, 16.362797),
    const LatLng(48.207966, 16.363176),
    const LatLng(48.207848, 16.363284),
    const LatLng(48.207757, 16.363312),
    const LatLng(48.20784, 16.36347),
    const LatLng(48.207928, 16.363635),
    const LatLng(48.208012, 16.363696),
    const LatLng(48.208089, 16.363675),
    const LatLng(48.208149, 16.363633),
    const LatLng(48.208315, 16.363987),
    const LatLng(48.20837, 16.364099),
    const LatLng(48.208393, 16.364272),
    const LatLng(48.208324, 16.364931),
    const LatLng(48.208292, 16.365484),
    const LatLng(48.208251, 16.365852),
    const LatLng(48.20819, 16.3662),
    const LatLng(48.208129, 16.366291),
    const LatLng(48.208174, 16.366379),
    const LatLng(48.208199, 16.366503),
    const LatLng(48.208193, 16.366609),
    const LatLng(48.208145, 16.366749),
    const LatLng(48.20808, 16.366824),
    const LatLng(48.208006, 16.366857),
    const LatLng(48.20795, 16.366856),
    const LatLng(48.207859, 16.366803),
    const LatLng(48.207844, 16.36693),
    const LatLng(48.207817, 16.367109),
    const LatLng(48.207739, 16.367534),
    const LatLng(48.207675, 16.367583),
    const LatLng(48.207577, 16.367659),
    const LatLng(48.2076, 16.367783),
    const LatLng(48.207571, 16.36786),
    const LatLng(48.207487, 16.367996),
    const LatLng(48.207247, 16.368346),
    const LatLng(48.206953, 16.369029),
    const LatLng(48.206832, 16.368916),
    const LatLng(48.206559, 16.369606),
    const LatLng(48.206847, 16.369838),
    const LatLng(48.207279, 16.370122),
    const LatLng(48.20712, 16.370733),
    const LatLng(48.207283, 16.370832),
    const LatLng(48.207219, 16.37127),
  ],
  [
    const LatLng(48.207219, 16.37127),
    const LatLng(48.207164, 16.371646),
    const LatLng(48.207102, 16.371633),
    const LatLng(48.207058, 16.372188),
    const LatLng(48.207037, 16.372425),
    const LatLng(48.206983, 16.372751),
    const LatLng(48.206928, 16.372962),
    const LatLng(48.206855, 16.373277),
    const LatLng(48.206813, 16.373381),
    const LatLng(48.206718, 16.373611),
    const LatLng(48.206495, 16.37401),
    const LatLng(48.206288, 16.374202),
    const LatLng(48.206269, 16.374213),
    const LatLng(48.205954, 16.374715),
    const LatLng(48.205885, 16.374932),
    const LatLng(48.205659, 16.375354),
    const LatLng(48.205577, 16.375437),
    const LatLng(48.205378, 16.375042),
  ],
  [
    const LatLng(48.205378, 16.375042),
    const LatLng(48.205333, 16.374952),
    const LatLng(48.20513, 16.374551),
    const LatLng(48.20501, 16.374487),
    const LatLng(48.204639, 16.374289),
    const LatLng(48.204426, 16.374159),
    const LatLng(48.203939, 16.373555),
    const LatLng(48.203619, 16.373163),
    const LatLng(48.20355, 16.373156),
    const LatLng(48.203538, 16.372898),
    const LatLng(48.203664, 16.372401),
    const LatLng(48.203189, 16.372151),
    const LatLng(48.202644, 16.371868),
    const LatLng(48.202825, 16.37106),
    const LatLng(48.202845, 16.370968),
    const LatLng(48.203032, 16.370158),
    const LatLng(48.203053, 16.370071),
    const LatLng(48.202841, 16.369962),
    const LatLng(48.202817, 16.36995),
  ],
  [
    const LatLng(48.202817, 16.36995),
    const LatLng(48.202647, 16.369861),
    const LatLng(48.202563, 16.369813),
    const LatLng(48.202493, 16.369774),
    const LatLng(48.202456, 16.369846),
    const LatLng(48.202388, 16.369809),
    const LatLng(48.20232, 16.369772),
    const LatLng(48.202279, 16.369749),
    const LatLng(48.202251, 16.369735),
    const LatLng(48.202174, 16.369678),
    const LatLng(48.202099, 16.369716),
    const LatLng(48.202071, 16.369717),
    const LatLng(48.202075, 16.369697),
    const LatLng(48.201993, 16.369661),
    const LatLng(48.201639, 16.369468),
    const LatLng(48.201281, 16.369289),
    const LatLng(48.201086, 16.369193),
    const LatLng(48.201039, 16.369158),
    const LatLng(48.200976, 16.369126),
    const LatLng(48.200822, 16.369045),
    const LatLng(48.2007, 16.369057),
    const LatLng(48.200678, 16.36899),
    const LatLng(48.20067, 16.368967),
    const LatLng(48.200424, 16.368838),
    const LatLng(48.200255, 16.368836),
    const LatLng(48.200141, 16.368704),
    const LatLng(48.199681, 16.36847),
    const LatLng(48.199506, 16.36838),
    const LatLng(48.199513, 16.368325),
    const LatLng(48.199478, 16.368309),
    const LatLng(48.199189, 16.368173),
    const LatLng(48.19916, 16.368087),
    const LatLng(48.199096, 16.368059),
    const LatLng(48.198747, 16.367915),
    const LatLng(48.198281, 16.367777),
    const LatLng(48.19821, 16.367754),
    const LatLng(48.198139, 16.367739),
    const LatLng(48.197574, 16.367621),
    const LatLng(48.197132, 16.367564),
    const LatLng(48.196634, 16.36749),
    const LatLng(48.196521, 16.367514),
    const LatLng(48.196448, 16.367582),
    const LatLng(48.196407, 16.367657),
    const LatLng(48.196379, 16.367623),
    const LatLng(48.196341, 16.367583),
    const LatLng(48.196298, 16.367537),
    const LatLng(48.196238, 16.368017),
    const LatLng(48.196195, 16.368105),
    const LatLng(48.196121, 16.368236),
    const LatLng(48.196078, 16.368347),
    const LatLng(48.196014, 16.368457),
    const LatLng(48.195728, 16.368782),
    const LatLng(48.19571, 16.368807),
    const LatLng(48.195686, 16.368842),
    const LatLng(48.195671, 16.368889),
    const LatLng(48.195628, 16.36888),
    const LatLng(48.195603, 16.368938),
  ],
];


  

  // Get the route segment between two waypoints
  static List<LatLng> getRouteSegment(int startIndex) {
    if (startIndex >= 0 && startIndex < routeSegments.length) {
      return routeSegments[startIndex];
    } else {
      throw Exception('No predefined route segment found');
    }
  }

  // Get the full predefined route by concatenating all segments
  static List<LatLng> getFullRoute() {
    List<LatLng> fullRoute = [];
    for (int i = 0; i < routeSegments.length; i++) {
      fullRoute.addAll(getRouteSegment(i));
    }
    return fullRoute;
  }

  // Method to get a specific LatLng from routeCoordinates
  static LatLng getLatLng(int index) {
    if (index >= 0 && index < routeCoordinates.length) {
      return routeCoordinates[index];
    } else {
      throw Exception('Index out of bounds');
    }
  }
}
