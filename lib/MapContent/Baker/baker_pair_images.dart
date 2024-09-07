// Define the directory path for storing image assets
import 'package:analyzer_plugin/utilities/pair.dart';

const String imagePath = 'assets/images/Baker/';


final List<Map<String, String>> imageSubtextsList1 = [
  {'image': 'heldenplatz_baker_1.jpeg', 'subtext': ''},
  {'image': 'heldenplatz_baker_2.jpg', 'subtext': ''},
];

final List<Map<String, String>> imageSubtextsList2 = [
  {'image': 'kaerntnerst_baker_2.jpg', 'subtext': ''},
  {'image': 'kaerntnerst_baker_tanz.jpg', 'subtext': ''},
  {'image': 'kaerntnerst_baker1.jpg', 'subtext': 'Josephine Baker mit Charlie Chaplin '},
];

final List<Map<String, String>> imageSubtextsList3 = [
  {'image': 'seilers_baker1.jpg', 'subtext': ''},
  {'image': 'seilers_baker_2.jpg', 'subtext': ''},
  {'image': 'seilers_baker_4.jpg', 'subtext': 'Josephine Baker mit ihrem Manager und drittem Ehemann Giuseppe Pepito Abatino'},
  {'image': 'seiler2s_baker_ronacher.jpg', 'subtext': 'Etablissement Ronacher'},
  {'image': 'seilers_baker_3.jpg', 'subtext': ''},
];

final List<Map<String, String>> imageSubtextsList4 = [
  {'image': 'ring_baker_1.jpg', 'subtext': ''},
  {'image': 'ring_baker_blackwomen.jpg', 'subtext': ''},
  {'image': 'ring_baker_hotel_bristl.jpg', 'subtext': 'Meldezettel - mit freundlicher Genehmigung der MA 8'},
];

final List<Map<String, String>> imageSubtextsList5 = [
  {'image': 'favoriten_baker_1.jpg', 'subtext': ''},
  {'image': 'favoriten_gedenktafel.jpg', 'subtext': ''},
  {'image': 'favoriten_johanstraustheater.jpg', 'subtext': 'das Johann Strauss Theater, abgerissen 1960'},
  {'image': 'favoriten_paris.jpg', 'subtext': ''},
];

List<Map<String, String>> getImageSubtextListBaker(int index) {
  switch (index) {
    case 0:
      return imageSubtextsList1;
    case 1:
      return imageSubtextsList2;
    case 2:
      return imageSubtextsList3;
    case 3:
      return imageSubtextsList4;
    case 4:
      return imageSubtextsList5;
    default:
      throw ArgumentError('Invalid index: $index');
  }
}

List<Pair<String, String>> createImageSubtextPairs(
    List<Map<String, String>> imagesSubtexts) {
  return imagesSubtexts
      .map((item) => Pair('$imagePath${item['image']}', item['subtext']!))
      .toList();
}