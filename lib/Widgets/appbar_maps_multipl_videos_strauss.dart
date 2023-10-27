import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicafemina/MapContent/All/video_urls.dart';
import 'package:musicafemina/Style/app_style.dart';

import '../Pages/video_player.dart';

class CustomAppBarMoreStrauss extends StatelessWidget implements PreferredSizeWidget {
  final AudioPlayer audioPlayer;
final Function(MapController) onMapUpdate;
  final String title;
  final double height;
  final Color bgColor;
  final VoidCallback onLeadingButtonPressed;
  final MapController _mapController = MapController();

 CustomAppBarMoreStrauss({
    Key? key,
    required this.audioPlayer,

    required this.title,
    this.height = kToolbarHeight,
    required this.bgColor,
    required this.onLeadingButtonPressed,
      required this.onMapUpdate,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Styles.primaryColor,
          onPressed: () {
    onLeadingButtonPressed();
    onMapUpdate(_mapController);  // Pass the MapController instance
  },
),
      
  actions: [
  PopupMenuButton<String>(
     color: Colors.white,
  
     padding: EdgeInsets.zero,
    icon: Icon(Icons.video_collection, color: Styles.primaryColor),
    onSelected: (String url) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerPage(videoUrl: url),
        ),
      );
    
       audioPlayer.stop();
    },
    itemBuilder: (BuildContext context) {
      return VideoUrls().namedStraussUrls.entries.map((entry) {
  return PopupMenuItem<String>(
    value: entry.value,
    child: 
    Row(
      children: [
        Icon(Icons.music_video, color: Styles.primaryColor,),
        const SizedBox(width: 10,),
        Text(entry.key, style: Styles.textMain,),
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
