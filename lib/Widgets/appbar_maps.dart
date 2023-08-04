import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../Pages/video_player.dart';
import '../Pages/menu.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AudioPlayer audioPlayer;
  final String videoUrl;

  const CustomAppBar({
    Key? key,
    required this.audioPlayer,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      toolbarHeight: 100,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.red,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Menu()));
          audioPlayer.stop();
        },
      ),
      actions: [
        IconButton(
            color: Colors.red,
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
      title: Image.asset(
        'assets/images/mf_logo_B.png',
        fit: BoxFit.cover,
        height: 100,
      ),
    );
  }
}
