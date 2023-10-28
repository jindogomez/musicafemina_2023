import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicafemina/MapContent/All/video_urls.dart';
import 'package:musicafemina/Style/app_style.dart';

import '../Pages/video_player.dart';


class CustomAppBarMore extends StatelessWidget implements PreferredSizeWidget {
  final AudioPlayer audioPlayer;
 final Color imageFilterColor;
  final String title;
  final double height;
  final Color bgColor;
  final VoidCallback onLeadingButtonPressed;
    final Function(MapController) onMapUpdate;
  final MapController _mapController = MapController();

 CustomAppBarMore({
    Key? key,
    required this.audioPlayer,
     required this.onMapUpdate,

    required this.title,
    this.height = kToolbarHeight,
    required this.bgColor,
    required this.onLeadingButtonPressed, 
    required this.imageFilterColor,
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
      return VideoUrls().namedWienerUrls.entries.map((entry) {
  return PopupMenuItem<String>(
    value: entry.value,
    child: 
    Row(
      children: [
  Icon(Icons.movie_creation_outlined, color: Styles.primaryColor,),
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
        backgroundColor: Colors.black.withOpacity(0.5), 
  
  flexibleSpace: Image(
    image:  const AssetImage('assets/images/mf_main_bg.png'),
    fit: BoxFit.cover,
    color: imageFilterColor,
    colorBlendMode: BlendMode.srcOver,
  ),
    );
  }
}
