import 'package:analyzer_plugin/utilities/pair.dart';

const String basePath = 'assets/images/strauss_img/';

// folder names
final List<String> folders = [
  'strauss_karlsplatz',
  'strauss_landstrasserhpt',
  'strauss_nussdorf',
  'strauss_palaiscoburg',
  'strauss_prater',
  'strauss_wiednerhauptstr',
  'strauss_zieglergasse',
];

// list of image-subtext map lists for each folder
final Map<String, List<Map<String, String>>> imagesSubtextsMap = {
  'strauss_karlsplatz': [
    {
      'image':
          'Allegory_on_the_betrothal_of_Crown_Prince_Rudolf_and_Stephanie_of_Belgium.jpg',
      'subtext':
          'Allegorie auf die Verlobung des Kronprinzen Rudolf und Stephanie von Belgien'
    },
    {
      'image': 'Gisela Frankl – Bezirksmuseum Leopoldstadt.jpg',
      'subtext': 'Gisela Frankl – Bezirksmuseum Leopoldstadt'
    },
    {
      'image': 'Gisela FranklÖsterreichische Nationalbibliothek.jpg',
      'subtext': 'Gisela Frankl – Österreichische Nationalbibliothek'
    },
    {
      'image': 'Musikvereinsgebäude_Schlusssteinlegung_01_03_1870.jpg',
      'subtext': 'Musikvereinsgebäude Schlusssteinlegung'
    },
    {
      'image': 'Rudolf_Habsburg_and_Princess_Stephanie.jpg',
      'subtext': 'Rudolf von Habsburg und Prinzessin Stephanie'
    },
  ],
  'strauss_landstrasserhpt': [
    {'image': 'drehersaal-bm03.jpg', 'subtext': 'Drehersaal'},
    {'image': 'head_drehersetablissement_bm03.jpg', 'subtext': 'Drehersaal'},
    {
      'image':
          'Postkarte_SuesseMaedelnAK_10101828_ScanHB.Wiener Damen.Orchester.jpg',
      'subtext': ' Wiener Damen Orchester'
    },
  ],
  'strauss_nussdorf': [
    {'Sechter.jpg': '', 'subtext': 'Sechter'},
    {
      'image': 'SisiAnkunftInNußdorf.jpg',
      'subtext': 'Sissi Ankunft in Nußdorf'
    },
    {'image': 'Tomasek.jpg', 'subtext': 'Tomasek'},
  ],
  'strauss_palaiscoburg': [
    {'image': 'Coburgpalais.jpg', 'subtext': 'Coburgpalais'},
    {
      'image': 'Family_portrait_of_Prinz_Leopold_of_Saxe-Coburg-Gotha.jpg',
      'subtext': 'Familienporträt von Prinz Leopold von Sachsen'
    },
    {
      'image': 'Geiger_Konstanze_Adelheid_Therese.jpg',
      'subtext': 'Konstanze Adelheid Therese Geiger'
    },
  ],
  'strauss_prater': [
    {
      'image': '640px-Eingangstor_Weltausstellung_1873.jpg',
      'subtext': 'Eingangstor Weltausstellung'
    },
    {
      'image':
          '640px-Weinlichs_Damenorchester,_Erstes_Europäisches_Damenorchester.png',
      'subtext': 'Erstes Europeisches Damenorchester'
    },
    {
      'image': 'Damenkapelle.jpg',
      'subtext': 'Adam Weiningers Restaurant und Café'
    },
    {
      'image': 'gelaende_der_wiener_weltausstellung_mit_rotunde_original.jpg',
      'subtext': 'Wiener Weltausstellung'
    },
    {
      'image': 'Rotunde_Weltausstellung_1873.jpg',
      'subtext': 'Rotunde Weltausstellung'
    },
  ],
  'strauss_spiegelgasse': [
    {
      'image': 'FranzSchubert_1826_JosephineFröhlichMitte)oestnationalbib.jpg',
      'subtext': 'Franz Schubert und Josephine Fröhlich 1826'
    },
    {'image': 'Josephine_Froehlich.jpg', 'subtext': 'Josephine_Froehlich'},
    {
      'image': 'Moritz_Michael_Daffinger_Franz_Grillparzer.jpg',
      'subtext': 'Franz Grillparzer von Moritz Michael Daffinger'
    },
    {
      'image':
          'Waldmüller_La_soprano_Josephine_Fröhlich,_el_barítono_Johann_Michael_Vogl_y_Franz_Schubert_cantan_y_tocan_un_lied_a_tres_voc.png',
      'subtext': 'Franz Schubert, Josephine Fröhlich, Johann Michael Vogl'
    },
  ],
  'strauss_wiednerhauptstr': [
    {'image': 'GoldenesLamm_AntiquariatJohannesMüllerSzbg.jpg', 'subtext': 'GoldenesLamm - Antiquariat Johannes Müller'},
    {'image': 'GoldenesLamm.jpg', 'subtext': 'Goldenes Lamm'},
  ],
  'strauss_zieglergasse': [
    {'image': '640px-Groepsportret_eerste_Europese_damesorkest_Erstes_Europäisches_Damen-Orchester_(titel_op_object),_RP-F-F00627.jpg', 'subtext': 'Erstes Europäisches Damen Orchester'},
    {'image': 'Weinlich.sophie-drinker-institut.jpg', 'subtext': 'Weinlich Sophie'},
  ],
};

List<Pair<String, String>> createImageSubtextPairs(String folder) {
  final imagePath =
      '$basePath$folder/'; // =  final imagePath = basePath + folder + '/';
  return imagesSubtextsMap[folder]!
      .map((item) => Pair('$imagePath${item['image']}', item['subtext']!))
      .toList();
}

List<Map<String, String>> getImageSubtextList(int index) {
  if (index > 0 && index <= folders.length) {
    return imagesSubtextsMap[folders[index - 1]]!;
  } else {
    throw ArgumentError('Invalid index: $index');
  }
}