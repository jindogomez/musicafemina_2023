import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Pages/menu.dart';

class CustomAppBarVideos extends StatelessWidget
    implements PreferredSizeWidget {
  final YoutubePlayerController controller;

  const CustomAppBarVideos({
    super.key,
    required this.controller,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80.0); // set height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      toolbarHeight: 80,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.red,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Menu()));
          controller.pause();
        },
      ),
      title: Image.asset(
        'assets/images/mf_logo_B.png',
        fit: BoxFit.cover,
        height: 80,
      ),
    );
  }
}
