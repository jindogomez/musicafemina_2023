const String basePath = 'assets/images/orte_der_demokratie';

// folder names
final List<String> folders = [

 'Yella_Hertzka _Kelsen Institut',
   'Berta Zuckerkandl_Strudlhofstiege',
   'Berta_Zuckerkandl_Salon_Oppolzergasse_6',
  'Wiener_Frauenklub _Tuchlaueben_11',
  'Eugenie_Schwarzwald_Wallner Strasse_9',
  'Grete_Rehor_Park',
  'Konzerthaus_Ethel_Smyth',
  'Musikverein_Friedenskongress',

];

String _generateFullPath(String folderName, String imageName) {
  return '$basePath/$folderName/$imageName';
}

final Map<String, List<Map<String, String>>> rawImageSubtextsMap = {

  'Yella_Hertzka _Kelsen Institut': [
    {
      'image': 'Cottage-LyzeumKopie.jpg',
      'subtext': 'Cottage Lyzeum'
    },

    {'image': 'Yella_Hertzka.jpg', 'subtext': 'Yella Hertzka'},

   

  ],


    'Berta Zuckerkandl_Strudlhofstiege': [
    {'image': 'Berta und Emil Kopie.jpg', 'subtext': 'Bertha Zuckerkandl mit ihrem Enkel Emil'},
    {
      'image': 'Berta_Zuckerkandl Kopie.jpg',
      'subtext': 'Bertha Zuckerkandl'
    },
    {
      'image': 'Bertha_Zuckerkandl_von_Vilma_Elisabeth_von_Parlaghy_Brochfeld.jpg',
      'subtext': 'Bertha Zuckerkandl gemalt von Vilma Elisabeth von Parlaghy Brochfeld '
    },

     {
      'image': 'Carl_Moll.jpeg',
      'subtext': 'Weißes Interieur von Carl Moll / Speisezimmer der Bertha Zuckerkandl '
    },
  ],
  'Eugenie_Schwarzwald_Wallner Strasse_9': [
    {
      'image':
          'Eugenie_Schwarzwald.jpg',
      'subtext':
          'Eugenie Schwarzwald (1872–1940)'
    },
    {
      'image': 'AlbanBerg.jpg',
      'subtext': 'Eugenie Schwarzwald im Kreise ihrer Dozenten: links Alban Berg und Egon Wellesz , hinter ihr Helen Berg, rechts Hermann Schwarzwald '
    },
    {
      'image': 'ESPorträOttoKokoschka.jpg',
      'subtext': 'Eugenie Schwarzwald Porträt von Kokoschka',
    },
    
    {
      'image': 'Privat-Mädchen-Lyzeums.jpg',
      'subtext': 'Eugenie Schwarzwald als Direktorin ihres Privat-Mädchenlyzeum'
    },
  ],
  'Wiener_Frauenklub _Tuchlaueben_11': [
    {
      'image':
          'Der Wiener Frauenklub Kopie.jpg',
      'subtext': 'Der Wiener Frauenklub'
    },
    {
      'image': 'Wiener Frauenklub Kopie.jpg',
      'subtext': ''
    },
  ],
  'Grete_Rehor_Park': [
    {
      'image': 'Grete_Rehor_ Kopie.jpg',
      'subtext': ' Grete Rehor'
    },
    {'image': 'Gruppenfoto.jpg', 'subtext': 'Gruppenfoto der Regierung Klaus I nach Regierungsumbildung, Fritz Kern, Wien, 19.1.1968. ÖNB, Bildarchiv und Grafiksammlung.'},
  ],
  'Konzerthaus_Ethel_Smyth': [
    {'image': 'Portrait_of_Ethel_Smyth.jpg', 'subtext': 'Portrait von Ethel Smyth'},

    {'image': 'March of the Women.jpg', 'subtext': '“March of the Women” von 1930'},
   
  ],
  'Musikverein_Friedenskongress': [
    {
      'image': '8678327-ifffkongressplakat1921oenb.jpg',
      'subtext': 'Friedenskongress Plakat'
    },
  
    {
      'image': 'friedencongress.jpg',
      'subtext': 'Friedenskongress'
    },
   
  ],
  'Berta_Zuckerkandl_Salon_Oppolzergasse_6': [
    {'image': '1Oppolzergasse_7.jpg', 'subtext': 'Oppolzergasse 6'},
    {
      'image': 'Bibliothek.jpg',
      'subtext': 'Salon (Copyright mit "Stadt Wien)“'
    },
    {'image': 'Café_Landtmann_Gedenktafel_Zuckerkandl_ViennaKopie.jpg', 'subtext': 'Gedenktafel Bertha Zuckerkandl'},
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
