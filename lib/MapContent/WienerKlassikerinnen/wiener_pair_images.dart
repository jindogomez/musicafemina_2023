const String basePath = 'assets/images/wiener_img';

// folder names
final List<String> folders = [
  'wiener_marxerfriedhof',
  'wiener_rasumovskygasse',
  'wiener_ungargasse',
  'Wiener_postgasse', 
  'wiener_michaelerkirche',
  'wiener_rabensteig',
  'wiener_helferstorferstrasse', 
  'wiener_himmelpfortgasse',
  'wiener_kohlmarkt',
  'wiener_augustinerkirche',
  'wiener_karlsplatz',
  'wiener_florianigasse',
];

String _generateFullPath(String folderName, String imageName) {
  return '$basePath/$folderName/$imageName';
}

final Map<String, List<Map<String, String>>> rawImageSubtextsMap = {
  'wiener_marxerfriedhof': [
    {
      'image': 'Nannette Streiche porträt.jpeg',
      'subtext': 'Nannette Streicher'
    },
  ],
  'wiener_rasumovskygasse': [
    {'image': 'ParadisPalais_Mesmer.jpg', 'subtext': 'Palais Mesmer'},
  ],
  'wiener_ungargasse': [
    {
      'image': 'Nannette_Ungargasse_46.jpg',
      'subtext': 'Erinnerungstafel Ungarngasse 46'
    },
  ],

    'Wiener_postgasse': [
    {'image': 'Dr_Ignaz_Seipel_Platz1.jpg', 'subtext': 'Älterer Passauer Hof'},
  ],
  'wiener_michaelerkirche': [
    {'image': 'Martines 1773.jpg', 'subtext': 'Martines 1773'},
  ],
  'wiener_rabensteig': [
    {'image': 'Paradis Haus_Rabensteig_8.JPG', 'subtext': 'Haus Rabensteig '},
    {'image': 'Testament Paradis Kopie.jpg', 'subtext': 'Testament Paradis '},
    {
      'image': 'Testament Paradis Seite 3 Kopie.jpg',
      'subtext': 'Testament Paradis Seite 3 '
    },
  ],
    'wiener_helferstorferstrasse': [
    {'image': 'errinerung.png', 'subtext': 'Anzeige der Ernennung von Josepha Gollenhofer (Wiener Zeitung, 24.2.1808)'},
     { 'image': 'hofkalender.png', 'subtext': 'Seite des Wiener Hofkalenders aus dem Jahr 1808'},
  ],
  'wiener_himmelpfortgasse': [
    {
      'image': 'AuernhammerHimmelpfortgasse_6-Josepha.jpg',
      'subtext': 'Himmelpfortgasse 6'
    },
    {
      'image': 'Auernhammer_Himmelpfortgasse.jpg',
      'subtext': 'Erinnerungs Tafel'
    },
  ],
'wiener_kohlmarkt': [
    {'image': 'Grosses_Michaelerhaus.jpg', 'subtext': 'Michaelerhaus'},
    {
      'image': 'Metastasio,_Großes_Michaelerhaus,_Vienna.jpg',
      'subtext': 'Metastasio,  Michaelerhaus'
    },
    {
      'image': 'metastasiomichaelerhaus_1gt.jpg',
      'subtext': 'Erinnerungs Tafel'
    },
  ],
  'wiener_augustinerkirche': [
    {'image': 'Augustinian_Church_Vienna.jpg', 'subtext': ''},
    {
      'image': 'ParadisAugustinerkirche.jpg',
      'subtext': ''
    },
    {
      'image': 'ParadisAugustinerkirche2.jpg',
      'subtext': ''
    },
  ],
  

  'wiener_karlsplatz': [
    {'image': 'Musikverein_um_1898.jpg', 'subtext': 'Musikverein um 1898'},
    {
      'image': 'Nannette Streicher und klavier.jpeg',
      'subtext': 'Nannette Streicher und Klavier'
    },
  ],
  'wiener_florianigasse': [
    {'image': 'Blahetka.jpg', 'subtext': 'Anna Maria Leopoldine Blahetka'},
    {
      'image': 'Blahetka Guntramsdorf Tafel .JPG',
      'subtext': 'Erinnerungstafel in Guntramsdorf'
    },
  ],
};

List<Map<String, String>> getImageSubtextListWithFullPath(int index) {
  try {
    if (index >= 0 && index < folders.length) {
      String folder = folders[index];
      return imageSubtextsMap[folder] ?? [];
    } else {
      return [];
    }
  } catch (e) {
    return [];
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
