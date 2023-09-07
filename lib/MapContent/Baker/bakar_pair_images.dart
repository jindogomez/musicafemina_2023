// image_subtext_pairs.dart
import 'package:analyzer_plugin/utilities/pair.dart';

const String imagePath = 'assets/images/Baker/';

final List<Map<String, String>> imageSubtextsList1 = [
  {'image': 'heldenplatz_baker_1.jpeg', 'subtext': 'Josephine Baker'},
  {'image': 'heldenplatz_baker_2.jpg', 'subtext': 'Josephine Baker2'},
];

final List<Map<String, String>> imageSubtextsList2 = [
  {'image': 'kaerntnerst_baker_2.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'kaerntnerst_baker_tanz.jpg', 'subtext': 'Tänzerin'},
  {'image': 'kaerntnerst_baker1.jpg', 'subtext': 'Josephine Baker'},
];

final List<Map<String, String>> imageSubtextsList3 = [
  {'image': 'seilers_baker1.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'seilers_baker_2.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'seilers_baker_4.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'seilers_baker_ronacher.jpg', 'subtext': 'Etablissement Ronacher'},
  {'image': 'seilers_baker_3.jpg', 'subtext': 'Josephine Baker'},
];

final List<Map<String, String>> imageSubtextsList4 = [
  {'image': 'ring_baker_1.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'ring_baker_blackwomen.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'ring_baker_hotel_bristl.jpg', 'subtext': 'Hotel Bristol'},
];

final List<Map<String, String>> imageSubtextsList5 = [
  {'image': 'favoriten_baker_1.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'favoriten_gedenktafel.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'favoriten_johanstraustheater.jpg', 'subtext': 'Josephine Baker'},
  {'image': 'favoriten_paris.jpg', 'subtext': 'Josephine Baker'},
];

List<Pair<String, String>> createImageSubtextPairs(
    List<Map<String, String>> imagesSubtexts) {
  return imagesSubtexts
      .map((item) => Pair('$imagePath${item['image']}', item['subtext']!))
      .toList();
}

// Function to get a specific list by index
List<Map<String, String>> getImageSubtextList(int index) {
  switch (index) {
    case 1:
      return imageSubtextsList1;
    case 2:
      return imageSubtextsList2;
    case 3:
      return imageSubtextsList3;
    case 4:
      return imageSubtextsList4;
    case 5:
      return imageSubtextsList5;
    default:
      throw ArgumentError('Invalid index: $index');
  }
}
