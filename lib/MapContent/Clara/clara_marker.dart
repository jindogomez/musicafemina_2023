// Fertig
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:latlong2/latlong.dart';

const String path = 'assets/images/Clara/';
const String pathaudio = 'assets/audio/Clara/';

class MapMarkerClara {
  final List<Pair<String, String>> imageSubtextPairs;

  final String? backgroundImage;
  final String? audioClip;
  final String? title;
  final String? address;
  final String? text;
  final LatLng? location;
  final LatLng? music;

  MapMarkerClara({
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

  MapMarkerClara(
    //Bilder und Bild Untertitel für die Cards -> Pair (Bild, Untertitel)
    imageSubtextPairs: [
      Pair('${path}Clara_Tuchlauben/Altes_Musikvereinsgebäude.jpg',
          'Altes Musikvereinsgebäude'),
      Pair('${path}Clara_Tuchlauben/TiuchlaubenGesderMusikfreunde.jpg',
          'Tuchlauben 12'),
      Pair('${path}Clara_Tuchlauben/Wieck-Torte.jpg', 'Torte à la Wieck'),
    ],

    audioClip: '${pathaudio}Tuchlauben 12.mp3',
    music: null,
    backgroundImage: 'assets/images/blank.png',
    title: '',
    address: 'Tuchlauben 12',
    text:
        'Das Gebäude auf der Tuchlauben 12, das Haus zum roten Igel, war zwar nicht das erste Gebäude der Gesellschaft der Musikfreunde. Aber das erste eigene: Es wurde 1822 angemietet und 1829 von der Gesellschaft für Musikfreunde gekauft. Das Haus auf der Tuchlauben hieß zum roten Igel und die Gesellschaft ließ einen dreistöckigen Neubau mit Konzertsaal erbauen. Das Festkonzert zur Eröffnung des Saales fand am 4. November 1831 statt, während die Cholera in Wien wütete. Fast 40 Jahre lang waren hier das Konservatorium und das Archiv der Gesellschaft, Büros und Probenräume untergebracht. Im Dezember 1837 konzertierte Clara Wieck Schumann erstmals in Wien. Auf insgesamt neun Reisen gab sie hier bis 1872 70 Konzerte.  Am 7. Januar 1838 spielte sie ihre Bellini-Variationen und ihren Hexentanz aus op.5. 1839 wurde Clara Schumann, im Jahr ihrer Eheschließung, mit 19 Jahren, jüngstes  Ehrenmitglied der Gesellschaft.',
    location: const LatLng(48.210333041716, 16.3708946928166),
  ),

  MapMarkerClara(
    imageSubtextPairs: [
      Pair('${path}Clara_Graben/kaiserhymne.jpg', 'Kaiserhymne'),
      Pair('${path}Clara_Graben/Franz_Joseph_1865.jpg', 'Franz Joseph (1865)'),
      Pair('${path}Clara_Graben/Clara_Schumann_Franz_Luckhardt.png',
          'Clara Schumann von Franz Luckhardt'),
    ],
    audioClip: '${pathaudio}Graben 19.mp3',
    music: null,
    backgroundImage: 'assets/images/blank.png',
    title: '',
    address: 'Graben 19',
    text:
        'Graben 19, Ecke Kohlmarkt: Hier befand sich der Musikverlag Tobias Haslinger.Und hier wurde Clara Schumanns berühmtestes und eines der schönsten Klavierstücke verlegt, das Impromptu Souvenir de Vienne. Clara Schumann hat es, nach ihrer Ernennung zur kaiserlich - königlichen Kammervirtuosin, erschaffen und es in Dankbarkeit dem Kaiser gewidmet. Darin eingewoben findet man daher auch Stellen aus der Kaiserhymne.',
    location: const LatLng(48.2095862539005, 16.368266492727),
  ),

  MapMarkerClara(
    imageSubtextPairs: [
      Pair('${path}Clara_Bauernmarkt/clarajung.jpeg', 'Junge Clara Schumann'),
      Pair('${path}Clara_Bauernmarkt/Grundhof_1940.jpg', 'Grundhof(1940)'),
      Pair('${path}Clara_Bauernmarkt/Robert Schumann.jpg', 'Robert Schumann'),
      Pair('${path}Clara_Bauernmarkt/Grillparzer.jpg', 'Franz Grillparzer'),
      Pair(
          '${path}Clara_Bauernmarkt/Joseph von Eichendorff  Foto H.-P.Haack.jpg',
          'Joseph von Eichendorff (Foto H.-P.Haack)'),
    ],
    audioClip: '${pathaudio}Bauernmarkt 4.mp3',
    music: null,
    backgroundImage: 'assets/images/blank.png',
    title: '',
    address: 'Bauernmarkt 4',
    text:
        'Wir stehen hier: Bauernmarkt 4, Brandstätte 5. Hier bestand von 1820 bis 1822 die Gesellschaft der Musikfreunde. Es war der sogenannte Gundlhof, ein riesiges Areal, ein Zentrum Wiens. Clara Schumann wohnte hier gemeinsam mit ihrem Mann Robert, unterrichtete und konzertierte hier von 1876 bis 1877 und gab im Jänner ihr Abschlusskonzert. Bei dieser Matinée stellte sie zum ersten Mal ihr Trio vor, nicht zuletzt vor einem prominenten Auditorium: mit Joseph von Eichendorff und Franz Grillparzer.',
    location: const LatLng(48.2095954782485, 16.3718016394278),
  ),
  MapMarkerClara(
    imageSubtextPairs: [
      Pair('${path}Clara_Heldenplatz/clara schumann 2.jpg',
          'Clara Wieck Schumann Portrait'),
      Pair('${path}Clara_Heldenplatz/Robert Schumann.jpg',
          'Robert Schumann Portrait'),
      Pair('${path}Clara_Heldenplatz/Johannes_Brahms_portrait.jpg',
          'Johannes Brahms Portrait'),
      Pair('${path}Clara_Heldenplatz/Sam. Alter Musikinstrumente .jpg',
          'Musikinstrumente'),
    ],
    audioClip: '${pathaudio}Heldenplatz.mp3',
    music: null,
    backgroundImage: 'assets/images/blank.png',
    title: '',
    address: 'Heldenplatz',
    text:
        'Hier im Kunsthistorischen Museum, in der Sammlung alter Musikinstrumente, finden wir einen Flügel, gebaut von Conrad Graf, der ihn Clara Wieck im Jahre 1838 aus Anlass ihrer triumphalen Konzertreise nach Wien geschenkt hatte. Nach ihrer Eheschließung wurde er überdies gern von ihrem Mann Robert Schumann benutzt. Nach seinem Tod schenkte sie ihn Johannes Brahms, der ihn bereits zu Lebzeiten der Gesellschaft der Musikfreunde vermachte, nachdem der Flügel anlässlich der Wiener Weltausstellung 1873 ausgestellt worden war. Heute ist das Instrument in der Neuen Hofburg zu besichtigen.',
    location: const LatLng(48.2064362317004, 16.3631424119305),
  ),
  MapMarkerClara(
    imageSubtextPairs: [
      Pair('${path}Clara_Musikvereinplatz/musikverein_alt.png', 'Musikverein'),
      Pair('${path}Clara_Musikvereinplatz/Brahms Saal 1.jpg', 'Brahms Saal'),
      Pair('${path}Clara_Musikvereinplatz/Brahms_4c 1.jpg', 'Johannes Brahms'),
    ],
    audioClip: '${pathaudio}Musikvereinsplatz 1.mp3',
    music: null,
    title: '',
    backgroundImage: 'assets/images/blank.png',
    text:
        'Wir stehen hier vor der Gesellschaft der Musikfreunde, das bislang letzte, das neueste Haus, das sie sich erbaut hat und das bis heute auch das Archiv beherbergt, den Konzertsaal, die Sammlungen. Clara Schumann war bereits 1837 Ehrenmitglied der Musikfreunde und hier finden wir auch die einzige Büste der Komponistin, im Übrigen auch der einzigen Frau, der hier in dieser Form gehuldigt wird. Am 19. Jänner 1870 eröffnete Clara Schuman das Schatzkästchen, den kleineren Bruder des Großen Saals, den Kleinen Saal, seit 1937 benannt nach einem anderen Ehrenmitglied des Hauses, Johannes Brahms.',
    address: 'Musikvereinsplatz 1',
    location: const LatLng(48.200655004143, 16.372817971454),
  ),

  MapMarkerClara(
    imageSubtextPairs: [
      Pair('${path}Clara_Argentienierstraße/1288432_default.jpg',
          'Palais Wittgenstein'),
      Pair(
          '${path}Clara_Argentienierstraße/4_The_grand_staircase_in_the_Alleegasse.jpg',
          'Palais Wittgenstein, Stiege'),
      Pair(
          '${path}Clara_Argentienierstraße/Palais_Wittgenstein_Musiksalon_1910.JPG',
          'Brahms Saal'),
      Pair(
          '${path}Clara_Argentienierstraße/Palais_Wittgenstein_Rote_Salon_1910.JPG',
          'Palais Wittgenstein'),
      Pair('${path}Clara_Argentienierstraße/Clara_Schumann_1853.jpg',
          'Clara Schumann, 1853'),
      Pair('${path}Clara_Argentienierstraße/Alma_Mahler_1899a.jpg',
          'Alma Mahler, 1899'),
    ],
    audioClip: '${pathaudio}Argentinierstraße16.mp3',
    music: null,
    title: '',
    backgroundImage: 'assets/images/blank.png',
    text:
        ',Das Haus Argentinierstraße 16 lässt von seiner einstigen Blüte, Schönheit und Reichtum nichts mehr ahnen: Bis in die 1950er Jahre stand hier das Palais der Wittgensteins. Wir wissen allerdings nachweislich, dass Clara Schumann hier zu Gast war, sie hat hier wohl auch unterrichtet und konzertiert.Unter der illustren Gästeschar, die hier im Palais Wittgenstein bewirtet wurde, war nicht nur Johannes Brahms, sondern z.B. auch eine weitere Komponistin, Alma Mahler. ',
    address: 'Argentinierstraße 16',
    location: const LatLng(48.196682165848536, 16.37206196960226),
  ),
];
