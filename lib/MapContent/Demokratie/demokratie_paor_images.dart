const String basePath = 'assets/images/orte_der_demokratie';

// folder names
final List<String> folders = [
  'Berta Zuckerkandl_Strudlhofstiege',
  'Berta_Zuckerkandl_Salon_Oppolzergasse_6',
  'Eugenie_Schwarzwald_Wallner Strasse_9',
  'Grete_Rehor_Park',
  'Konzerthaus_Ethel_Smyth',
  'Musikverein_Friedenskongress',
  'Wiener_Frauenklub _Tuchlaueben_11',
  'Yella_Hertzka _Kelsen Institut',
];

String _generateFullPath(String folderName, String imageName) {
  return '$basePath/$folderName/$imageName';
}

final Map<String, List<Map<String, String>>> rawImageSubtextsMap = {
  'strauss_palaiscoburg': [
    {'image': 'Coburgpalais.jpg', 'subtext': 'Coburg Palais'},
    {
      'image': 'Family_portrait_of_Prinz_Leopold_of_Saxe-Coburg-Gotha.jpg',
      'subtext': 'Familienporträt von Prinz Leopold von Sachsen'
    },
    {
      'image': 'Geiger_Konstanze_Adelheid_Therese.jpg',
      'subtext': 'Constanze Adelheid Therese Geiger'
    },
  ],
  'strauss_spiegelgasse': [
    {
      'image': 'FranzSchubert_1826_JosephineFröhlichMitteoestnationalbib.jpg',
      'subtext': 'Franz Schubert und Josefine Fröhlich 1826'
    },

    {'image': 'Josephine_Froehlich.jpg', 'subtext': 'Josefine Fröhlich'},

    {
      'image': 'Moritz_Michael_Daffinger_Franz_Grillparzer.jpg',
      'subtext': 'Franz Grillparzer von Moritz Michael Daffinger'
    },

    {
      'image':
          'Waldmüller_La_soprano_Josephine_Fröhlich,_el_barítono_Johann_Michael_Vogl_y_Franz_Schubert_cantan_y_tocan_un_lied_a_tres_voc.png',
      'subtext': 'Franz Schubert, Josefine Fröhlich, Johann Michael Vogl'
    },

  ],
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
  'strauss_zieglergasse': [
    {
      'image':
          '640px-Groepsportret_eerste_Europese_damesorkest_Erstes_Europäisches_Damen-Orchester_(titel_op_object),_RP-F-F00627.jpg',
      'subtext': 'Erstes Europäisches Damen Orchester'
    },
    {
      'image': 'Weinlich.sophie-drinker-institut.jpg',
      'subtext': 'Josephine Weinlich'
    },
  ],
  'strauss_wiednerhauptstr': [
    {
      'image': 'GoldenesLamm_AntiquariatJohannesMüllerSzbg.jpg',
      'subtext': ' Tonlithographie aus Rudolf Alt Wien'
    },
    {'image': 'GoldenesLamm.jpg', 'subtext': 'Zum Goldenes Lamm'},
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
  'strauss_nussdorf': [
    {'image': 'Sechter.jpg', 'subtext': 'Sechter'},
    {
      'image': 'SisiAnkunftInNußdorf.jpg',
      'subtext': 'Sissi Ankunft in Nußdorf'
    },
    {'image': 'Tomasek.jpg', 'subtext': 'Tomasek'},
  ],
};
List<Map<String, String>> getImageSubtextListWithFullPath(int index) {
  try {
    if (index >= 0 && index < folders.length) {
      String folder = folders[index];
      return imageSubtextsMap[folder] ?? [];
    } else {
     
      return []; // Return an empty list or throw an exception, based on your needs
    }
  } catch (e) {

    return []; // Return an empty list or throw an exception, based on your needs
  }
}

final Map<String, List<Map<String, String>>> imageSubtextsMap =
    rawImageSubtextsMap.map((folder, images) {
  return MapEntry(
      folder,
      images.map((img) {
        return {
          'image': _generateFullPath(folder, img['image'] ?? ''),
          'subtext': img['subtext'] ?? ''
        };
      }).toList());
});
