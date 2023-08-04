import 'package:latlong2/latlong.dart';

class AppConstants {
  /// Mapbox access token
  static const String mapBoxUrl =
      "https://api.mapbox.com/styles/v1/landl0s/ckhw0f5290i2i19p8fzl92a68/tiles/256/{z}/{x}/{y}@2x";
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoibGFuZGwwcyIsImEiOiJja2h2eXY0dXI1ODgxMzVsNmd0dnQwdG4zIn0.2R2Vu1FpicdYg1ts13b8BA';

  ///Style of the map
  static const String id = 'mapbox://styles/landl0s/ckhw0f5290i2i19p8fzl92a68';

  /// Starting location of the map
  static const myLocation = LatLng(48.210333041716, 16.3708946928166);
}
