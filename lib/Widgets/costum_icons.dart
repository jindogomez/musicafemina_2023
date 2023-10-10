import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class CustomIcon extends StatelessWidget {
  final LatLng location;
  final String imageAsset;
  final VoidCallback onTap;

  const CustomIcon({
    super.key,
    required this.location,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imageAsset,
        width: 60,
        height: 60,
      ),
    );
  }
}
