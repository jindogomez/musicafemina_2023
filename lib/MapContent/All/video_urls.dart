class VideoUrls {
  final videoClara = 'https://www.laurusedelbacher.com/mf/ClaraSchumann.mp4';
  final videoBaker = 'https://www.laurusedelbacher.com/mf/JosephineBaker.mp4';
  final videoNs = 'https://www.laurusedelbacher.com/mf/Die_Verfemten.mp4';

  final videoWiener1 =
      'https://www.laurusedelbacher.com/mf/WienerK_Maria_Theresia_Paradis.mp4';

        final videoWiener2 =
      'https://www.laurusedelbacher.com/mf/WienerK_MariannavonMartines.mp4';


  final videoStrauss1 = 'https://www.laurusedelbacher.com/mf/strauss/PalaisCoburg.mp4';
    final videoStrauss2 = 'https://www.laurusedelbacher.com/mf/strauss/Spiegelgasse.mp4';
      final videoStrauss3 = 'https://www.laurusedelbacher.com/mf/strauss/Musikverein.mp4';
        final videoStrauss4 = 'https://www.laurusedelbacher.com/mf/strauss/Zieglergasse.mp4';
          final videoStrauss5 = 'https://www.laurusedelbacher.com/mf/strauss/Lamm.mp4';
          final videoStrauss6 = 'https://www.laurusedelbacher.com/mf/strauss/Landstraße.mp4';
      
             
                final videoStrauss8 = 'https://www.laurusedelbacher.com/mf/strauss/Nussdorf.mp4';



  Map<String, String> get namedWienerUrls => {
        'Maria Theresia Paradis': videoWiener1,
        'Marianna von Martines': videoWiener2,
      };



        Map<String, String> get namedStraussUrls => {
        'Palais Coburg': videoStrauss1,
        'Spiegelgasse': videoStrauss2,
        'Musikverein': videoStrauss3,
        'Zieglergasse': videoStrauss4,
        'Wiedner Hauptstraße ': videoStrauss5,
               'Landstraße Hauptstraße ': videoStrauss6,
     
  
           'Nussdorf Donau Schifffahrt': videoStrauss8,
      };
}