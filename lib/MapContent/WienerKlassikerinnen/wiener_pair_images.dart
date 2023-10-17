const String basePath = 'assets/images/assets/wiener_img';
// TODO: nur 10 bilder -> 12.texte
// folder names
final List<String> folders = [
  'wiener_augustinerkirche',
  'wiener_florianigasse',
  'wiener_himmelpfortgasse',
  'wiener_karlsplatz',
  'wiener_kohlmarkt',
  'wiener_marxerfriedhof',
  'wiener_michaelerkirche',
  'wiener_rabensteig',
  'wiener_rasumovskygasse',
  'wiener_ungargasse',
];

String _generateFullPath(String folderName, String imageName) {
  return '$basePath/$folderName/$imageName';
}

final Map<String, List<Map<String, String>>> rawImageSubtextsMap = {
  'wiener_augustinerkirche': [
    {'image': 'Augustinian_Church_Vienna.jpg', 'subtext': 'Augustinerkirche'},
    {
      'image': 'ParadisAugustinerkirche.jpg',
      'subtext': 'Paradis Augustinerkirche'
    },
    {
      'image': 'ParadisAugustinerkirche2.jpg',
      'subtext': 'Paradis Augustinerkirche'
    },
  ],
  'wiener_florianigasse': [
    {'image': 'Blahetka.jpg', 'subtext': 'Anna Maria Leopoldine Blahetka'},
    {
      'image': 'Blahetka Guntramsdorf Tafel .JPG',
      'subtext': 'Erinnerungs Tafel'
    },
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
  'wiener_karlsplatz': [
    {'image': 'Musikverein_um_1898.jpg', 'subtext': 'Musikverein um 1898'},
    {
      'image': 'Nannette Streicher und klavier.jpeg',
      'subtext': 'Nannette Streicher und Klavier'
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
  'wiener_marxerfriedhof': [
    {
      'image': 'Nannette Streiche porträt.jpeg',
      'subtext': 'Nannette Streiche Porträt'
    },
  ],
  'wiener_rabensteig': [
    {'image': 'Martines 1773.jpg', 'subtext': 'Martines 1773'},
  ],
  'wiener_rasumovskygasse': [
    {
      'image': 'Paradis Haus_Rabensteig_8.JPG',
      'subtext': 'Paradis Haus Rabensteig 8'
    },
    {'image': 'Testament Paradis Kopie.jpg', 'subtext': 'Testament Paradis'},
    {
      'image': 'Testament Paradis Seite 3 Kopie.jpg',
      'subtext': 'Testament Paradis ',
    },
  ],
  'wiener_michaelerkirche': [
    {'image': 'ParadisPalais_Mesmer.jpg', 'subtext': 'Paradis Palais Mesmer'},
  ],
  'wiener_ungargasse': [
    {
      'image': 'Nannette_Ungargasse_46.jpg',
      'subtext': 'Nannette Ungargasse 46'
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
