/// to do: Muss befüllt werden mit den Daten von Irene
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';

const String path = 'assets/images/Baker/';
const String pathaudio = 'assets/audio/baker/';

class MapMarkerBaker {
  final List<Pair<String, String>> imageSubtextPairs;

  final String? backgroundImage;
  final String? audioClip;
  final String? title;
  final String? address;
  final String? text;
  final LatLng? location;
  final LatLng? music;

  MapMarkerBaker({
    required this.backgroundImage,
    required this.imageSubtextPairs,
    required this.audioClip,
    required this.title,
    required this.text,
    required this.address,
    required this.location,
    required this.music,
  });
}

final mapMarkers = [
  //Clara Wieck Schumann

  MapMarkerBaker(
    title: '',
    backgroundImage: 'assets/images/blank.png',
    address: 'Parlament',
    location: const LatLng(48.2082242087015, 16.3585868480227),
    text:
        'Als im Februar 1928 Josephine Baker im Wiener Theater Ronacher auftreten sollte, kam es im Parlament zu einer mehrstündigen Debatte. Der christlich-soziale Abgeordnete Anton Jerzabek hielt eine von theatralischen Zwischenrufen und von Gelächter unterbrochene Brandrede gegen Josephine Baker, erregte sich über ihre Kunst, über ihr Federn- und Perlenkostüm und verglich sie mit "einer Wilden aus dem Kongo".',

    //Bilder und Bild Untertitel für die Cards -> Pair (Bild, Untertitel)
    imageSubtextPairs: [
      Pair('${path}heldenplatz_baker_1.jpeg', 'Josephine Baker'),
      Pair('${path}heldenplatz_baker_2.jpg', 'Josephine Baker'),
    ],

    audioClip: 'assets/audio/baker/baker_bristol.mp3',
    music: null,
  ),

  MapMarkerBaker(
    title: '',
    backgroundImage: 'assets/images/blank.png',
    address: 'Kärntnerdurchgang',
    location: const LatLng(48.2071834219, 16.371258207246),
    text:
        'Strohkoffer, heute der Keller unter der American Loos Bar: Alfred Schmeller, der Kunsthistoriker, fand für den Artclub ein neues Lokal im Kärntnerdurchgang, den Keller unter der American Bar, die Alfred Loos im Jahre 1908 entworfen hatte. Dieser KünstlerInnen-Treffpunkt, der seinen Namen nach den mit Strohmatten ausgelegten Wänden hatte, bestand von 1951 bis 1953. Als 1952 das „Porgy and Bess-Ensemble“ in Wien gastierte – bekanntlich hatte George Gershwin seine Oper black singers reserviert – war der Strohkoffer das einzige Lokal in Wien, wo die Gäste willkommen waren – darunter Leontyne Price und Cab Calloway.',
    imageSubtextPairs: [
      Pair('${path}kaerntnerst_baker_2.jpg', 'Josephine Baker'),
      Pair('${path}kaerntnerst_baker_tanz.jpg', 'Tänzerin'),
      Pair('${path}kaerntnerst_baker1.jpg', 'Josephine Baker'),
    ],
    audioClip: 'assets/audio/baker/baker_bristol.mp3',
    music: null,
  ),

  MapMarkerBaker(
    title: '',
    backgroundImage: 'assets/images/blank.png',
    address: 'Seilerstätte 9',
    location: const LatLng(48.2053744179023, 16.375045749243),
    text:
        'Als die Zeitungen vom „N...skandal“ sprachen, die katholische Kirche Sondergottesdienste zur Buße gegen Bakers „schwere Verstöße gegen die Moral“ organisierte und die National- sozialistische Deutsche Arbeiterpartei (NSDAP) Wiens gegen die „obszönen“ Auftritte protestierte, entzogen die Behörden dem Ronacher-Theater 1928 die Bewilligung für die Show. Erst 1932 durfte Baker im Ronacher ein gefeiertes Gastspiel geben, danach erst wieder 1958.',
    imageSubtextPairs: [
      Pair('${path}seilers_baker1.jpg', 'Josephine Baker'),
      Pair('${path}seilers_baker_2.jpg', 'Josephine Baker'),
      Pair('${path}seilers_baker_4.jpg', 'Josephine Baker'),
      Pair('${path}seilers_baker_ronacher.jpg', 'Etablissement Ronacher'),
      Pair('${path}seilers_baker_3.jpg', 'Josephine Baker'),
    ],
    audioClip: 'assets/audio/baker/baker_bristol.mp3',
    music: null,
  ),
  MapMarkerBaker(
    title: '',
    backgroundImage: 'assets/images/blank.png',
    address: 'Kärntner Ring 1',
    location: const LatLng(48.2027537234097, 16.370222119149),
    text:
        'Im Ringstraßen Hotel Bristol und im nahe gelegenen Anna Grand Hotel wohnte Josephine Baker mehrmals bei ihren Wien-Besuchen seit den 1920er Jahren. Von diesen Aufenthalten sind die Meldezettel überliefert mit ihrer eigenhändigen Unterschrift. Die Bristol Hotels in ganz Europa nennen mittlerweile eine ihrer Suiten nach Josephine Baker.',
    imageSubtextPairs: [
      Pair('${path}ring_baker_1.jpg', 'Josephine Baker'),
      Pair('${path}ring_baker_blackwomen.jpg', 'Josephine Baker'),
      Pair('${path}ring_baker_hotel_bristl.jpg', 'Hotel Bristol'),
    ],
    audioClip: 'assets/audio/Clara/Heldenplatz.mp3',
    music: null,
  ),
  MapMarkerBaker(
    title: '',
    backgroundImage: 'assets/images/blank.png',
    address: 'Favoritenstraße 8',
    location: const LatLng(48.1955981451396, 16.368934135274),
    text:
        'Josephine Baker trat 1928 in der Revue „Schwarz auf Weiß" im Johann Strauß-Theater auf. Nach 1945 hieß das Etablissement Scala-Theater. 1959 wurde das Theater, das über 1.000 Personen fasste, abgerissen.',
    imageSubtextPairs: [
      Pair('${path}favoriten_baker_1.jpg', 'Josephine Baker'),
      Pair('${path}favoriten_gedenktafel.jpg', 'Josephine Baker'),
      Pair('${path}favoriten_johanstraustheater.jpg', 'Josephine Baker'),
      Pair('${path}favoriten_paris.jpg', 'Josephine Baker'),
    ],
    audioClip: 'assets/audio/Clara/Musikvereinsplatz 1.mp3',
    music: null,
  ),
];
