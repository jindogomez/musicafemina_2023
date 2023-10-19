const String basePath = 'assets/images/ns_img';

final List<String> folders = [
  'ns_alserstrasse',
  'ns_johannesgasse_fehlt',
  'ns_kaasgraben',
  'ns_oppolzergasse',
  'ns_rahlgasse',
  'ns_rechtewienzeile',
  'ns_strozzigasse',
  'ns_wollzeile',
];

String _generateFullPath(String folderName, String imageName) {
  return '$basePath/$folderName/$imageName';
}

final Map<String, List<Map<String, String>>> rawImageSubtextsMap = {
  
  'ns_rechtewienzeile': [
    {'image': 'NS_RechteWienzeile.jpg', 'subtext': 'Rechte Wienzeile'},
    {'image': "HildaLoeweFlatter.jpg", 'subtext': 'Hilda Loewe'},
    {
      'image': 'hilde_loewe_moriaschen.jpg',
      'subtext': 'Moria Schen Ankündigung'
    },
    {
      'image': 'HildeLoewe_Ankuendigung_1944.jpg',
      'subtext': 'Hilde Loewe, Josef cetner Ankündigung - 1944'
    },
    {
      'image':
          'HildeLoewe_TextFritzLohner_WienBerlinLeipzig_EditionScala_1930.jpg',
      'subtext': 'Hilda Loewe/Henry Love - Edition Scala - 1930'
    },
    {
      'image': 'HildeLoeweFotostudioFayerWien1925.jpg',
      'subtext': 'Hilde Loewe - Fotostudio Fayer Wien - 1925'
    },
  ],

    'ns_strozzigasse': [
    {'image': "NS_Strozzigasse8.jpg", 'subtext': '1080 Strozzigasse 8'},
    {
      'image': "Vally_Weigl_©_Georg_Fayer.jpg",
      'subtext': 'Vally Weigl - Fotostudio Fayer Wien'
    },
  ],

    'ns_kaasgraben': [
    {
      'image': '1190Kaasgrabengasse36MariaHoferYellaHertzka.jpg',
      'subtext': '1190 Kaasgrabengasse 36 - Maria Hofer - Yella Hertzka'
    },
  ],


  'ns_alserstrasse': [
    {
      'image': 'LisaMariaMayer_1925_OENB.jpg',
      'subtext': 'LisaMariaMayer - 1925 - Österreichische Nationalbibliothek'
    },
  ],

  'ns_oppolzergasse': [
    {'image': 'JosefineWinter.jpg', 'subtext': 'Josefine Winter'},
  ],

    'ns_wollzeile': [
    {
      'image': 'Ns_Wollzeile36.jpg',
      'subtext': '1010 Wollzeile 36 - Kabarett Simpl'
    },
    {
      'image':
          'Camilla_Frydan_IchbraucheinMaedl_Hans-Joerg_Gaugelhofer_EnsembleOperTee_2022.jpg',
      'subtext':
          'Camilla Frydan - Ich brauch ein Maedl - Hans-Joerg Gaugelhofer - Ensemble Oper Tee - 2022'
    },
    {
      'image': 'CamillaFrydan_1920_unbekannt.png',
      'subtext': 'Camilla Frydan - 1920'
    },
    {
      'image': 'CamillaFrydan_Abschiedsbrief_1920_unbekannt.jpg',
      'subtext': 'Camilla Frydan - Abschiedsbrief - 1920'
    },
  ],

 'ns_johannesgasse_fehlt': [
    {
      'image': 'fehlt.jpg',
      'subtext': 'fehlt'
    },
  ],

  'ns_rahlgasse': [
    {
      'image': '1060Rahlgasse4AnitaBildMaedchengym.jpg',
      'subtext': '1060 Rahlgasse 4 - Anita Bild - Mädchengymnasium'
    },
  ],
  


 
};

List<Map<String, String>> getImageSubtextListWithFullPath(int index) {
  if (index < 0 || index >= folders.length) {
    throw ArgumentError('Invalid index: $index');
  }

  String folder = folders[index];
  return imageSubtextsMap[folder] ?? [];
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
