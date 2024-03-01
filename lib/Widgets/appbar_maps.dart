import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicafemina/Services/music_manegar.dart';
import 'package:musicafemina/Style/app_style.dart';

import '../Pages/video_player.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AudioPlayer audioPlayer;
  final String videoUrl;
  final String title;
  final double height;
  final Color bgColor;
  final VoidCallback onLeadingButtonPressed;
  final Function(MapController) onMapUpdate;
  final MapController _mapController = MapController();
  final Color imageFilterColor;
  final Color backgroundColor;
   final AudioManager audioManager = AudioManager();
  CustomAppBar({
    Key? key,
    required this.audioPlayer,
    required this.videoUrl,
    required this.title,
    this.height = kToolbarHeight,
    required this.bgColor,
    required this.onLeadingButtonPressed,
    required this.onMapUpdate,

    required this.imageFilterColor, required this.backgroundColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
shadowColor: Styles.primaryColor,
      centerTitle: true,
      toolbarHeight: 100,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Styles.primaryColor,
        onPressed: () {
          onLeadingButtonPressed();
          onMapUpdate(_mapController);
        },
      ),
      actions: [
        IconButton(
            color: Styles.primaryColor,
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerPage(videoUrl: videoUrl),
                  ));
              audioPlayer.stop();
                   
  await  audioManager.stopAll(); 
            },
            icon: const Icon(Icons.video_collection)),
      ],
      title: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Styles.primaryColor,
              fontSize: 22,
              fontFamily: GoogleFonts.abel().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Stadtspaziergang',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: GoogleFonts.abel().fontFamily,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
 
        backgroundColor: backgroundColor,
  flexibleSpace: Image(
    image:  const AssetImage('assets/images/mf_main_bg.png'),
    fit: BoxFit.cover,
    color: imageFilterColor,
    colorBlendMode: BlendMode.srcOver,
  ),
    );
  }
}
