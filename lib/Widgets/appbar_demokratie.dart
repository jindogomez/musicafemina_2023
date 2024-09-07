import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'package:musicafemina/Style/app_style.dart';

import '../Pages/video_player.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AudioPlayer audioPlayer;
  final Function(MapController) onMapUpdate;
  final String title;
  final double height;
  final Color bgColor;
  final VoidCallback onLeadingButtonPressed;
  final Color imageFilterColor;
  final Map<String, String> videoUrls;
  final bool isCardVisible;
  final VoidCallback toggleCardVisibility;
  final VoidCallback disposeAudio; 

  const CustomAppBar({
    Key? key,
    required this.audioPlayer,
    required this.imageFilterColor,
    required this.title,
    this.height = kToolbarHeight,
    required this.bgColor,
    required this.onLeadingButtonPressed,
    required this.onMapUpdate,
    required this.videoUrls,
    required this.isCardVisible,
    required this.toggleCardVisibility,
    required this.disposeAudio, 
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
        onPressed: isCardVisible ? toggleCardVisibility : onLeadingButtonPressed,
      ),
      actions: [
        PopupMenuButton<String>(
          color: Colors.white,
          padding: EdgeInsets.zero,
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.video_collection, color: Styles.primaryColor),
              Text(
                'Videos',
                style: TextStyle(
                  color: Styles.primaryColor,
                  fontSize: 12,
                  fontFamily: GoogleFonts.abel().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onSelected: (String url) {
            disposeAudio(); // Add this line to dispose the audio
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerPage(videoUrl: url),
              ),
            );
            audioPlayer.stop();
          },
          itemBuilder: (BuildContext context) {
            return videoUrls.entries.map((entry) {
              return PopupMenuItem<String>(
                value: entry.value,
                child: Row(
                  children: [
                    Icon(Icons.movie_creation_outlined, color: Styles.primaryColor),
                    const SizedBox(width: 10),
                    Text(entry.key, style: Styles.textMain),
                  ],
                ),
              );
            }).toList();
          },
        ),
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
      backgroundColor: Colors.black.withOpacity(0.5),
      flexibleSpace: Image(
        image: const AssetImage('assets/images/mf_main_bg.png'),
        fit: BoxFit.cover,
        color: imageFilterColor.withOpacity(0.1),
        colorBlendMode: BlendMode.srcOver,
      ),
    );
  }
}