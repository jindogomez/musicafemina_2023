import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicafemina/Style/app_style.dart';

import '../Pages/video_player.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AudioPlayer audioPlayer;
  final String videoUrl;
  final String title;
  final double height;
  final Color bgColor;
  final VoidCallback onLeadingButtonPressed;

  const CustomAppBar({
    Key? key,
    required this.audioPlayer,
    required this.videoUrl,
    required this.title,
    this.height = kToolbarHeight,
    required this.bgColor,
    required this.onLeadingButtonPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Styles.primaryColor,
        onPressed: onLeadingButtonPressed, 
      ),
      actions: [
        IconButton(
            color: Styles.primaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerPage(videoUrl: videoUrl),
                  ));
              audioPlayer.stop();
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
           Text('Stadtspaziergang',  style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: GoogleFonts.abel().fontFamily,
              fontWeight: FontWeight.normal,
            ),  ),
        ],
      ),
   flexibleSpace: const Image(
          image: AssetImage('assets/images/mf_main_bg.png'), 
          fit: BoxFit.cover,
        ),
         shape: Border(
    bottom: BorderSide(
      color: Styles.primaryColor,
      width: 0.2
    
    )
    ),
    );
  }
}
